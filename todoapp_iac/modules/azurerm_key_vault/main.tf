data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "vault" {
    for_each = var.key_vault
  name                        = each.value.name
  location                    = each.value.location
  resource_group_name         = each.value.rg_name
  enabled_for_disk_encryption = lookup(each.value, "enabled_for_disk_encryption", true)
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = lookup(each.value, "soft_delete_retention_days", 10)
  purge_protection_enabled    = lookup(each.value, "purge_protection_enabled", true)
  sku_name                    = each.value.sku_name
  public_network_access_enabled = lookup(each.value, "public_network_access_enabled", true)

  dynamic "access_policy" {
    for_each = each.value.access_policies
    content {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

     key_permissions         = lookup(access_policy.value, "key_permissions", [])
     secret_permissions      = lookup(access_policy.value, "secret_permissions", [])
     storage_permissions     = lookup(access_policy.value, "storage_permissions", [])
     certificate_permissions = lookup(access_policy.value, "certificate_permissions", [])
    }
   }
  }
