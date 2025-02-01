# Scaleway OpenTofu Configuration

This repository contains OpenTofu configurations to provision and manage resources on Scaleway, including a private network, a Kubernetes (K8s) cluster, and secure storage of the Kubeconfig in Scaleway's Secret Manager. It supports multiple environments (e.g., `dev`, `qa`, `prod`) using separate variable files.

## Features

- **Private Network**: Creates a private network for secure communication between resources.
- **Kubernetes Cluster**: Provisions a managed Kubernetes cluster with configurable node pools, auto-scaling, and auto-healing.
- **Secret Management**: Securely stores the Kubeconfig file in Scaleway's Secret Manager for easy access and management.
- **Multi-Environment Support**: Use separate variable files for different environments (e.g., `dev`, `qa`, `prod`).
