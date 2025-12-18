data "azurerm_resource_group" "data_resource" {
  name = var.rg_name
}

data "azurerm_mssql_server" "sql_server_info" {
  name                = var.sql_server_name
  resource_group_name = data.azurerm_resource_group.data_resource.name
}
