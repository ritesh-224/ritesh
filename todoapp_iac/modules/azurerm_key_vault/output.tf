output "key_vault_id" {
  description = "The ID of the Key Vault"
  value       = azurerm_key_vault.vault["kv1"].id
}

output "key_vault_name" {
  value = azurerm_key_vault.vault["kv1"].name
}