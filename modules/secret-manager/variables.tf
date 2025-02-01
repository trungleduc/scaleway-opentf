variable "secret_name" {
  description = "The name of the secret"
  type        = string
}

variable "secret_description" {
  description = "Description of the secret"
  type        = string
  default     = "A dynamically created secret"
}

variable "secret_value" {
  description = "The value of the secret"
  type        = string
}
