output "public_ip_id" {
  description = "The ID of the Public IP"
  value       = azurerm_public_ip.pip["pip1"].id
}