module "k8s_cluster" {
  source       = "./modules/k8s-cluster"
  access_key   = var.scaleway_access_key
  secret_key   = var.scaleway_secret_key
  cluster_name = var.cluster_name
  pool_name    = var.pool_name
  k8s_version  = var.k8s_version
  region       = var.region
  node_type    = var.node_type
  node_count   = var.node_count
  autohealing  = var.autohealing
  autoscaling  = var.autoscaling
  min_size     = var.min_size
  max_size     = var.max_size
}

module "github_secrets" {
  source              = "./modules/github-secrets"
  github_token        = var.github_token
  github_organization = var.github_organization
  repository          = var.repository # Optional, if you want repo-specific secrets
  secret_name         = "KUBECONFIG_${var.cluster_name}"
  kubeconfig          = module.k8s_cluster.kubeconfig
}