terraform {
  required_providers {
    scaleway = {
      source  = "scaleway/scaleway"
      version = "~> 2.14"
    }
  }
}

resource "scaleway_secret" "secret_manager" {
  name        = var.secret_name
  description = var.secret_description
  tags        = ["managed-by-terraform"]
}

resource "scaleway_secret_version" "v1" {
  description = "version1"
  secret_id   = scaleway_secret.secret_manager.id
  data        = var.secret_value
  lifecycle {
    ignore_changes = [data]
  }
}