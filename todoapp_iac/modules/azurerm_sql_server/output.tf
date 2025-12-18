output "mssql_server_ids" {
  description = "The IDs of the MSSQL Servers"
  value       = azurerm_mssql_server.sql_server["mssql1"].id
}