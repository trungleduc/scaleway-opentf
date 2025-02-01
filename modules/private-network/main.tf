terraform {
  required_providers {
    scaleway = {
      source  = "scaleway/scaleway"
      version = "~> 2.14"
    }
  }
}


resource "scaleway_vpc_private_network" "private_network" {
  name = var.name
  tags = ["managed-by-terraform"]
}

output "id" {
  value = scaleway_vpc_private_network.private_network.id
}