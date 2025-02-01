variable "env_name" {
  description = "Deployment name"
  type        = string
}


variable "scaleway_access_key" {
  description = "Scaleway access key for authentication"
  type        = string
  sensitive   = true
}

variable "scaleway_secret_key" {
  description = "Scaleway secret key for authentication"
  type        = string
  sensitive   = true
}

variable "scaleway_organization_id" {
  type      = string
  sensitive = true
}

variable "scaleway_project_id" {
  type      = string
  sensitive = true
}


variable "scaleway_region" {
  description = "Scaleway region for the cluster"
  type        = string
  default     = "fr-par" # Default region
}

variable "cluster_name" {
  description = "Name of the Kubernetes cluster"
  type        = string
}

variable "pool_name" {
  description = "Name of the pool"
  type        = string
}

variable "k8s_version" {
  description = "Kubernetes version"
  type        = string
  default     = "1.25.3"
}

variable "region" {
  description = "Scaleway region"
  type        = string
  default     = "fr-par"
}

variable "node_type" {
  description = "Node type for the cluster"
  type        = string
}

variable "node_count" {
  description = "Number of nodes in the cluster"
  type        = number
}

variable "autohealing" {
  description = "Enable autohealing"
  type        = bool
  default     = true
}

variable "autoscaling" {
  description = "Enable autoscaling"
  type        = bool
  default     = true
}

variable "min_size" {
  description = "Minimum number of nodes in the pool"
  type        = number
}

variable "max_size" {
  description = "Maximum number of nodes in the pool"
  type        = number
}

variable "github_organization" {
  description = "GitHub organization name"
  type        = string
}


variable "github_token" {
  description = "GitHub personal access token with 'secrets' scope"
  type        = string
  sensitive   = true
}

variable "repository" {
  description = "GitHub repository to save the secret (optional)"
  type        = string
  default     = null
}

variable "secret_name" {
  description = "GitHub Action secret name"
  type        = string
  default     = null
}