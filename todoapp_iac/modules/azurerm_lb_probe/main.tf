resource "azurerm_lb_probe" "lb_probe" {
    for_each = var.health_prob
  loadbalancer_id = var.loadbalancer_id
  name            = each.value.name
  protocol        = each.value.protocol
  port            = each.value.port
}