resource "azurerm_mssql_server" "sql_server" {
    for_each = var.mssql_server
  name                         = each.value.server_name
  resource_group_name          = data.azurerm_resource_group.data_resource.name
  location                     = each.value.location
  version                      = "12.0"
  administrator_login          = each.value.server_login_name
  administrator_login_password = each.value.server_login_password
  minimum_tls_version          = "1.2"
  public_network_access_enabled = lookup(each.value, "public_network_access_enabled", true)
  tags                         = each.value.tags
}