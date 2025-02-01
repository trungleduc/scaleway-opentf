resource "scaleway_vpc_private_network" "private_network" {
  name = var.name
}

output "id" {
  value = scaleway_vpc_private_network.private_network.id
}