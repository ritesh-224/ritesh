resource "azurerm_lb" "azure_lb" {
    for_each = var.public_lb
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.rg_name
  sku                 = each.value.sku
  sku_tier            = each.value.sku_tier

  dynamic "frontend_ip_configuration" {
    for_each = each.value.frontend_ip_configs
    
    content {
    name                 = frontend_ip_configuration.value.name
    public_ip_address_id = var.public_ip
   }
 }
  tags = lookup(each.value, "tags", {})
}
