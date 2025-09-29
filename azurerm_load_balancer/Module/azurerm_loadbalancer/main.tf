resource "azurerm_lb" "test_lb" {
  name                = var.lb_name
  location            = var.location
  resource_group_name = var.rg_name

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = var.public_ip
  }
}

resource "azurerm_lb_backend_address_pool" "test_beap" {
  loadbalancer_id = azurerm_lb.test_lb.id
  name            = "BackEndAddressPool"
}

resource "azurerm_lb_probe" "lb_health" {
  loadbalancer_id = azurerm_lb.test_lb.id
  name            = "lb-health-probe"
  port            = 22
}

resource "azurerm_lb_rule" "lb_rule" {
  loadbalancer_id                = azurerm_lb.test_lb.id
  name                           = "LBRule"
  protocol                       = "Tcp"
  frontend_port                  = 22
  backend_port                   = 22
  frontend_ip_configuration_name = "PublicIPAddress"
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.test_beap.id]
  probe_id                       = azurerm_lb_probe.lb_health.id
}