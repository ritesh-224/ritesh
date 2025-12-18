variable "secrets" {
    type = map(object({
        name         = string
        value        = string
    }))
}
variable "key_vault_name" {
  type = string
}
variable "rg_name" {
  type = string
}