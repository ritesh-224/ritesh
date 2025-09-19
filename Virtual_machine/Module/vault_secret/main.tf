
# resource "azurerm_key_vault_secret" "username" {
#   name         = "username"
#   value        = var.secret_name
#   key_vault_id = var.key_vault_id
# }


resource "azurerm_key_vault_secret" "password" {
  name         = "password"
  value        = var.secret_value
  key_vault_id = var.key_vault_id
}

output "secret_value" {
    value = azurerm_key_vault_secret.password.value
}