data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "key_vault" {
    name                       = var.key_vault_name
    location                   = var.location
    enabled_for_disk_encryption = true
    resource_group_name        = var.rg_name
    sku_name                   = "standard"
    tenant_id                  = data.azurerm_client_config.current.tenant_id
    soft_delete_retention_days = 7

    access_policy {
        tenant_id = data.azurerm_client_config.current.tenant_id
        object_id = data.azurerm_client_config.current.object_id

        key_permissions = ["Get", "List", "Create", "Recover"]
        secret_permissions = ["Get", "List", "Set", "Delete", "Recover"]
    }
}

output "key_vault_id" {
    value = azurerm_key_vault.key_vault.id
}