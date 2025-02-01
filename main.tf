terraform {
  required_providers {
    scaleway = {
      source  = "scaleway/scaleway"
      version = "~> 2.14"
    }
  }
}

provider "scaleway" {
  region          = var.region
  access_key      = var.scaleway_access_key
  secret_key      = var.scaleway_secret_key
  organization_id = var.scaleway_organization_id
  project_id      = var.scaleway_project_id
}

module "private_network" {
  source = "./modules/private-network"
  name   = "${var.env_name}_private_network"
  providers = {
    scaleway = scaleway
  }
}

module "k8s_cluster" {
  source             = "./modules/k8s-cluster"
  region             = var.region
  private_network_id = module.private_network.id
  cluster_name       = "${var.env_name}_cluster"
  pool_name          = "${var.env_name}_pool"
  k8s_version        = var.k8s_version
  node_type          = var.node_type
  node_count         = var.node_count
  autohealing        = var.autohealing
  autoscaling        = var.autoscaling
  min_size           = var.min_size
  max_size           = var.max_size
  providers = {
    scaleway = scaleway
  }
}

module "store_kubeconfig" {
  source             = "./modules/secret-manager"
  secret_name        = "KUBECONFIG_${var.env_name}_cluster"
  secret_value       = module.k8s_cluster.kubeconfig
  secret_description = "Kubeconfig for ${var.env_name} Kubernetes cluster"

  providers = {
    scaleway = scaleway
  }
}