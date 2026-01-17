variable "mssql_server" {
  type = map(object({
  server_name                  = string
  rg_name                      = string
  location                     = string
  server_login_name            = string
  server_login_password        = string
  tags                         = optional(map(string))
  }))
}
