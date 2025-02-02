terraform {
  required_providers {
    scaleway = {
      source  = "scaleway/scaleway"
      version = "~> 2.14"
    }
  }
}


resource "scaleway_registry_namespace" "private_registry" {
  name      = var.name
  region    = var.scaleway_region
  is_public = false
}

output "registry_url" {
  value = scaleway_registry_namespace.private_registry.endpoint
}