# Scaleway OpenTofu Configuration

This repository contains OpenTofu configurations to provision and manage resources on Scaleway using Github Action, including a private container registry, private network, a Kubernetes (K8s) cluster, and secure storage of the Kubeconfig in Scaleway's Secret Manager. It supports multiple environments (e.g., `dev`, `qa`, `prod`) using separate variable files.

## Features

- **Private Network**: Creates a private network for secure communication between resources.
- **Private Container Registry**: Creates a private container registry for secure storage and distribution of container images.
- **Kubernetes Cluster**: Provisions a managed Kubernetes cluster with configurable node pools, auto-scaling, auto-healing and with access to the private container registry.
- **Secret Management**: Securely stores the Kubeconfig file in Scaleway's Secret Manager for easy access and management.
- **Multi-Environment Support**: Use separate variable files for different environments (e.g., `dev`, `qa`, `prod`).

## How To Deploy

### Prerequisites

- Fork this repository to your own Github account.
- Create a Scaleway account and obtain your API credentials.
- Create an object storage bucket to store the terraform state file.
- Update the `backend.tf` file with your object storage endpoint and bucket name.

### Github Action setup

- Create the following Github secrets:

```bash
TF_VAR_SCALEWAY_ACCESS_KEY=your-scaleway-access-key
TF_VAR_SCALEWAY_SECRET_KEY=your-scaleway-secret-key
TF_VAR_SCALEWAY_ORGANIZATION_ID=your-scaleway-organization-id
TF_VAR_SCALEWAY_PROJECT_ID=your-scaleway-project-id
AWS_ACCESS_KEY_ID=your-scaleway-access-key #  for terraform state file
AWS_SECRET_ACCESS_KEY=your-scaleway-secret-key #  for terraform state file
```

- Create Github environment: `dev`, `qa`, `prod`
- Update `envs/{dev|qa|prod}.tfvars` files with your environment specific variables.

## How To Use

In the application repository, create the following secrets:

```bash
SCALEWAY_ACCESS_KEY: your-scaleway-access-key
SCALEWAY_SECRET_KEY: your-scaleway-secret-key
SCALEWAY_PROJECT_ID: your-scaleway-project-id
SCALEWAY_REGION: your-scaleway-region
```

and environment `dev`, `qa`, `prod` with the following variables:

```bash
ENV_NAME= #dev or qa or prod
```

### How to get kubeconfig

The kubeconfig file is stored in Scaleway Secret Manager. You can retrieve it in your Github Action workflow using the following steps:

```yml
---
- name: Authenticate with Scaleway
  uses: scaleway/action-scw@v0
  with:
    access_key: ${{ secrets.SCALEWAY_ACCESS_KEY }}
    secret_key: ${{ secrets.SCALEWAY_SECRET_KEY }}
    project_id: ${{ secrets.SCALEWAY_PROJECT_ID }}
    region: ${{ secrets.SCALEWAY_REGION }}

- name: Fetch Kubeconfig from Scaleway Secret Manager
  run: |
    SECRET_NAME="KUBECONFIG_${{ vars.ENV_NAME }}_cluster"
    KUBECONFIG_CONTENT=$(scw secret version get latest ${SECRET_NAME} --output=json | jq -r '.data[0].value')
    echo "$KUBECONFIG_CONTENT" > kubeconfig.yaml
    echo "KUBECONFIG=$(pwd)/kubeconfig.yaml" >> $GITHUB_ENV
```

### How to authenticate with container registry

Opentofu will create 3 container registry namespaces: `{dev|qa|prod}_container_registry`. You can authenticate with the container registry in your Github Action using the following steps:

```yml
- name: Login to Scaleway Container Registry
  uses: docker/login-action@v3
  with:
    username: nologin
    password: ${{ secrets.SCALEWAY_SECRET_KEY }}
    registry: rg.${{ secrets.SCALEWAY_REGION }}.scw.cloud/${{ vars.ENV_NAME }}_container_registry
```
