# Scaleway OpenTofu Configuration

This repository contains OpenTofu configurations to provision and manage resources on Scaleway, including a private container registry, private network, a Kubernetes (K8s) cluster, and secure storage of the Kubeconfig in Scaleway's Secret Manager. It supports multiple environments (e.g., `dev`, `qa`, `prod`) using separate variable files.

## Features

- **Private Network**: Creates a private network for secure communication between resources.
- **Private Container Registry**: Creates a private container registry for secure storage and distribution of container images.
- **Kubernetes Cluster**: Provisions a managed Kubernetes cluster with configurable node pools, auto-scaling, auto-healing and with access to the private container registry.
- **Secret Management**: Securely stores the Kubeconfig file in Scaleway's Secret Manager for easy access and management.
- **Multi-Environment Support**: Use separate variable files for different environments (e.g., `dev`, `qa`, `prod`).
