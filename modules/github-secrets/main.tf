terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
}

provider "github" {
  token = var.github_token
  owner = var.github_organization
}

resource "github_actions_secret" "kubeconfig" {
  secret_name     = var.secret_name
  plaintext_value = var.kubeconfig
  repository      = var.repository # Repository to save the secret (optional for organization-wide secrets)
}

resource "github_actions_organization_secret" "org_kubeconfig" {
  secret_name     = var.secret_name
  plaintext_value = var.kubeconfig
  visibility      = "all" # Make it visible to all repositories in the organization
  depends_on      = [github_actions_secret.kubeconfig]
}

