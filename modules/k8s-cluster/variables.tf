variable "access_key" {
  description = "Scaleway access key for authentication"
  type        = string
  sensitive   = true
}

variable "secret_key" {
  description = "Scaleway secret key for authentication"
  type        = string
  sensitive   = true
}

variable "organization_id" {
  description = "Scaleway organization id"
  type        = string
  sensitive   = true
}
variable "project_id" {
  description = "Scaleway project id"
  type        = string
  sensitive   = true
}



variable "region" {
  description = "Scaleway region for the cluster"
  type        = string
  default     = "fr-par" # Default region
}
variable "cluster_name" {
  description = "Name of the Kubernetes cluster"
  type        = string
}

variable "k8s_version" {
  description = "Kubernetes version"
  type        = string
}

variable "pool_name" {
  description = "Name of the pool"
  type        = string
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
