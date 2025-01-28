module "k8s_cluster" {
  source = "./modules/k8s-cluster"

  cluster_name = var.cluster_name
  k8s_version  = var.k8s_version
  region       = var.region
  node_type    = var.node_type
  node_count   = var.node_count
  autohealing  = var.autohealing
  autoscaling  = var.autoscaling
  min_size     = var.min_size
  max_size     = var.max_size
}
