
variable "github_token" {
  description = "GitHub personal access token with 'secrets' scope"
  type        = string
  sensitive   = true
}

variable "github_organization" {
  description = "GitHub organization name"
  type        = string
}

variable "repository" {
  description = "GitHub repository to save the secret (optional)"
  type        = string
  default     = null
}

variable "secret_name" {
  description = "The name of the secret to create"
  type        = string
  default     = "KUBECONFIG"
}

variable "kubeconfig" {
  description = "The kubeconfig file content to save as a secret"
  type        = string
  sensitive   = true
}
