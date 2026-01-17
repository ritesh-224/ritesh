resource "azurerm_resource_group" "devrg" {
  for_each = var.rg
  name        = each.value.rg_name
  location    = each.value.location
  managed_by  = each.value.managed_by
  tags        = each.value.tags
}
