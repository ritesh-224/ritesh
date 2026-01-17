output "lb_id" {
  description = "The ID of the Azure Load Balancer"
  value       = azurerm_lb.azure_lb["lb1"].id
}

