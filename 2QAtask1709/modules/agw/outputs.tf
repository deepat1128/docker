output "gateway_public_ip" {
  value = azurerm_public_ip.gateway_ip.ip_address
}

output "gateway_id" {
  value = azurerm_application_gateway.gateway.id
}
output "gateway_subnet_id" {
  value = var.subnet_id
}

