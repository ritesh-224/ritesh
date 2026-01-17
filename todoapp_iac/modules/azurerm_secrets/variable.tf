variable "secrets" {
    type = map(object({
        name         = string
        value        = string
  }))
}

variable "key_vault_id" {
  type = string
}