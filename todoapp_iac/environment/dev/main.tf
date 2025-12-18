module "resource_group" {
    source = "../../modules/azurerm_resource_group"
    rgs = var.rgs
}

module "networks" {
    depends_on = [module.resource_group]
    source = "../../modules/azurerm_networking"
    networks = var.networks
}

module "public_ips" {
    depends_on = [module.resource_group]
    source = "../../modules/azurerm_public_ip"
    public_ips = var.public_ips
}

module "key_vault" {
    depends_on = [module.resource_group]
    source = "../../modules/azurerm_key_vault"
    key_vault = var.key_vault
}

module "secrets" {
    depends_on = [ module.key_vault ]
    source       = "../../modules/azurerm_key_vault_secrets"
    secrets      = var.secrets
    key_vault_name = module.key_vault.key_vault_name
    rg_name        = "test"
}

module "virtual_machines" {
    depends_on = [module.networks, module.public_ips, module.key_vault]
    source = "../../modules/azurerm_virtual_machine"
    vms = var.vms
}

module "mssql_server" {
  depends_on = [module.resource_group]
  source     = "../../modules/azurerm_sql_server"
  mssql_server = var.mssql_server
  rg_name      = "test"
}

module "mssql_database" {
  depends_on = [ module.resource_group, module.mssql_server ]
  source = "../../modules/azurerm_sql_database"
    mssql_database   = var.mssql_database
    rg_name          = "test"
    sql_server_name  = "todo-mssql-server"
}