output "lb_probe_id" {
  description = "The ID of the Load Balancer probe"
  value       = azurerm_lb_probe.lb_probe["probe1"].id
}
