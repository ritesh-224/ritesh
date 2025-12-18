data "azurerm_resource_group" "data_resource" {
  name = var.rg_name
}

data "azurerm_key_vault" "data_key_vault" {
  name                = var.key_vault_name
  resource_group_name = data.azurerm_resource_group.data_resource.name
}

resource "azurerm_key_vault_secret" "secrets" {
    for_each = var.secrets
    name         = each.value.name
    value        = each.value.value
    key_vault_id = data.azurerm_key_vault.data_key_vault.id
}