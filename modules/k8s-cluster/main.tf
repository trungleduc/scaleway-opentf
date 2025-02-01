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
  access_key      = var.access_key
  secret_key      = var.secret_key
  organization_id = var.organization_id
  project_id      = var.project_id
}

resource "scaleway_k8s_cluster" "cluster" {
  name                        = var.cluster_name
  version                     = var.k8s_version
  cni                         = "cilium"
  tags                        = ["manageed-by-terraform"]
  private_network_id          = var.private_network_id
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
  value     = scaleway_k8s_cluster.cluster.kubeconfig[0].config_file
  sensitive = true
}
