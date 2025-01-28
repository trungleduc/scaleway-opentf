variable "cluster_name" {
  description = "Name of the Kubernetes cluster"
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
