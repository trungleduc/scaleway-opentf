module "private_network" {
  source = "./modules/private-network"
  name   = "${var.env_name}_private_network"
}

module "k8s_cluster" {
  source             = "./modules/k8s-cluster"
  access_key         = var.scaleway_access_key
  secret_key         = var.scaleway_secret_key
  organization_id    = var.scaleway_organization_id
  project_id         = var.scaleway_project_id
  private_network_id = module.private_network.id
  cluster_name       = "${var.env_name}_cluster"
  pool_name          = "${var.env_name}_pool"
  k8s_version        = var.k8s_version
  region             = var.region
  node_type          = var.node_type
  node_count         = var.node_count
  autohealing        = var.autohealing
  autoscaling        = var.autoscaling
  min_size           = var.min_size
  max_size           = var.max_size
}

module "github_secrets" {
  source              = "./modules/github-secrets"
  github_token        = var.github_token
  github_organization = var.github_organization
  repository          = var.repository # Optional, if you want repo-specific secrets
  secret_name         = "KUBECONFIG_${var.env_name}_cluster"
  kubeconfig          = module.k8s_cluster.kubeconfig
}