resource "azurerm_lb_rule" "example" {
    for_each = var.lb_rules
  loadbalancer_id                = var.loadbalancer_id
  name                           = each.value.name
  protocol                       = each.value.protocol
  frontend_port                  = each.value.frontend_port
  backend_port                   = each.value.backend_port
  frontend_ip_configuration_name = each.value.frontend_ip_configuration_name
  backend_address_pool_ids       = var.backend_pool_id
  probe_id                       = var.probe_id
}