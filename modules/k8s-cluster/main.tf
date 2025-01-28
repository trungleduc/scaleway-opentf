resource "scaleway_k8s_cluster" "cluster" {
  name    = var.cluster_name
  version = var.k8s_version
  cni     = "Cilium"
  region  = var.region
}

resource "scaleway_k8s_pool" "pool" {
  cluster_id     = scaleway_k8s_cluster.cluster.id
  node_type      = var.node_type
  node_count     = var.node_count
  autohealing    = var.autohealing
  autoscaling    = var.autoscaling
  min_size       = var.min_size
  max_size       = var.max_size
}

output "kubeconfig" {
  value     = scaleway_k8s_cluster.cluster.kubeconfig
  sensitive = true
}
