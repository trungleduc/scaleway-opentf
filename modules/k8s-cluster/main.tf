terraform {
  required_providers {
    scaleway = {
      source  = "scaleway/scaleway"
      version = "~> 2.14"
    }
  }
}



resource "scaleway_k8s_cluster" "cluster" {
  name                        = var.cluster_name
  tags                        = ["managed-by-terraform"]
  version                     = var.k8s_version
  cni                         = "cilium"
  type                        = "kapsule"
  private_network_id          = var.private_network_id
  region                      = var.region
  delete_additional_resources = false
}

resource "scaleway_k8s_pool" "pool" {
  cluster_id  = scaleway_k8s_cluster.cluster.id
  tags        = ["managed-by-terraform"]
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
