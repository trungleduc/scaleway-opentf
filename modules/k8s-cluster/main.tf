terraform {
  required_providers {
    scaleway = {
      source  = "scaleway/scaleway"
      version = "~> 2.14"
    }
  }
}

provider "scaleway" {
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}

resource "scaleway_k8s_cluster" "cluster" {
  name                        = var.cluster_name
  version                     = var.k8s_version
  cni                         = "Cilium"
  region                      = var.region
  delete_additional_resources = false
}

resource "scaleway_k8s_pool" "pool" {
  cluster_id  = scaleway_k8s_cluster.cluster.id
  name        = var.pool_name
  node_type   = var.node_type
  size        = var.node_count
  autohealing = var.autohealing
  autoscaling = var.autoscaling
  min_size    = var.min_size
  max_size    = var.max_size

}

output "kubeconfig" {
  value     = scaleway_k8s_cluster.cluster.kubeconfig
  sensitive = true
}
