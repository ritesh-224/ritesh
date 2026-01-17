module "resource_group" {
  source = "../../modules/azurerm_resource_group"
  rg     = var.rg
}

module "networks" {
  depends_on = [module.resource_group]
  source     = "../../modules/azurerm_networking"
  networks   = var.networks
}

module "public_ips" {
  depends_on = [module.resource_group]
  source     = "../../modules/azurerm_public_ip"
  public_ips = var.public_ips
}

module "key_vault" {
  depends_on = [module.resource_group]
  source     = "../../modules/azurerm_key_vault"
  key_vault  = var.key_vault
}

module "secrets" {
  depends_on   = [module.key_vault]
  source       = "../../modules/azurerm_secrets"
  secrets      = var.secrets
  key_vault_id = module.key_vault.key_vault_id
}

module "virtual_machines" {
  depends_on = [module.networks, module.public_ips, module.key_vault, module.secrets]
  source     = "../../modules/azurerm_virtual_machine"
  vms        = var.vms
}

module "mssql_server" {
  depends_on   = [module.resource_group]
  source       = "../../modules/azurerm_sql_server"
  mssql_server = var.mssql_server
}

module "mssql_database" {
  depends_on     = [module.resource_group, module.mssql_server]
  source         = "../../modules/azurerm_sql_database"
  mssql_database = var.mssql_database
  server_id      = module.mssql_server.mssql_server_id
}

module "public_lb" {
  depends_on = [module.virtual_machines, module.resource_group, module.public_ips]
  source     = "../../modules/azurerm_lb"
  public_lb  = var.public_lb
  public_ip  = module.public_ips.public_ip_id
}

module "lb_backend_pool" {
  depends_on      = [module.public_lb]
  source          = "../../modules/azurerm_lb_backend_pool"
  loadbalancer_id = module.public_lb.lb_id
  lb_pool_name    = "lb-backend-pool"
}

module "health_probe" {
  depends_on      = [module.public_lb]
  health_prob     = var.health_prob
  source          = "../../modules/azurerm_lb_probe"
  loadbalancer_id = module.public_lb.lb_id
}

module "lb_rule" {
  depends_on      = [module.health_probe]
  lb_rules        = var.lb_rules
  source          = "../../modules/azurerm_lb_rule"
  loadbalancer_id = module.public_lb.lb_id
  backend_pool_id = [module.lb_backend_pool.backend_pool_id]
  probe_id        = module.health_probe.lb_probe_id
}

module "pool_nic_association" {
  depends_on      = [module.lb_rule, module.public_lb]
  source          = "../../modules/azurerm_pool_nic_association"
  nic_id          = module.virtual_machines.nic_id
  backend_pool_id = module.lb_backend_pool.backend_pool_id
}