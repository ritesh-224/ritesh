variable "secret_name" {
  description = "The name of the secret to be stored in Key Vault"
  type        = string
}

variable "secret_value" {
  description = "The value of the secret to be stored in Key Vault"
  type        = string
}

variable "key_vault_id" {
  description = "The ID of the Key Vault"
  type        = string
}

