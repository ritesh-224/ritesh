output "secrets_ids" {
  description = "The IDs of the Secrets"
  value       = { for k, v in azurerm_key_vault_secret.secrets : k => v.id }
}