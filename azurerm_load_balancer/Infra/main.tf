module "resource_group" {
  source              = "../Module/azurerm_resource_group"
  rg_name             = "motu-rg"
  location            = "East US"
}

module "virtual_network" {
  depends_on = [ module.resource_group ]
  source              = "../Module/azurerm_virtual_network"
  vnet_name           = "motu-vnet"
  vnet_address_space  = ["10.0.0.0/16"]
  location            = "East US"
  rg_name             = "motu-rg"
}         

module "subnet" {
  depends_on = [ module.virtual_network, module.resource_group ]
  source              = "../Module/azurerm_subnet"
  subnet_name         = "vm-subnet"
  rg_name             = "motu-rg"
  vnet_name           = "motu-vnet"
  address_prefixes    = ["10.0.1.0/24"] 
}

module "key_vault" {
  depends_on = [ module.resource_group ]
  source              = "../Module/azurerm_keyVault"
  key_vault_name      = "secretsfile"
  location            = "East US"
  rg_name             = "motu-rg" 
}

module "password" {
  depends_on = [ module.key_vault, module.resource_group ]
  source              = "../Module/azurerm_vault_secrets"
  secret_name         = "password"
  secret_value        = "Ritesh@12345"
  key_vault_id        = module.key_vault.key_vault_id
}

module "public_ip" {
  depends_on = [ module.resource_group ]
  source              = "../Module/azurerm_public_ip"
  pip_name            = "bastion-pip"
  rg_name             = "motu-rg"
  location            = "East US"
}

module "load_balancer" {
  depends_on = [ module.public_ip, module.resource_group ]
  source              = "../Module/azurerm_loadbalancer"
  lb_name             = "motu-lb"
  location            = "East US"
  rg_name             = "motu-rg"
  public_ip           = module.public_ip.public_ip_id
}

module "azure_vm1" {
  depends_on = [ module.subnet, module.password, module.resource_group, module.virtual_network ]
  source              = "../Module/azurerm_vm" 
  location            = "East US"
  rg_name             = "motu-rg"
  vm_name             = "motu-vm1"
  nic_name            = "vm1_nic"
  nic_config_name     = "vm1-ipconfig"
  admin_username      = "adminuser"
  admin_password      = module.password.secret_value
  subnet_id           = module.subnet.subnet_id
}

module "azure_vm2" {
  depends_on = [ module.subnet, module.password, module.resource_group, module.virtual_network ]
  source              = "../Module/azurerm_vm" 
  location            = "East US"
  rg_name             = "motu-rg"
  vm_name             = "motu-vm2"
  nic_name            = "vm2_nic"
  nic_config_name     = "vm2-ipconfig"
  admin_username      = "adminuser"
  admin_password      = module.password.secret_value
  subnet_id           = module.subnet.subnet_id
}

module "vm1_nic_lb_association" {
  depends_on = [ module.load_balancer, module.azure_vm1 ]
  source              = "../Module/azurerm_nic_lb_association"
  nic_id              = module.azure_vm1.nic_id
  ip_config_name     = "vm1-ipconfig"
  backend_pool_id    = module.load_balancer.backend_pool_id
}

module "vm2_nic_lb_association" {
  depends_on = [ module.load_balancer, module.azure_vm2 ]
  source              = "../Module/azurerm_nic_lb_association"
  nic_id              = module.azure_vm2.nic_id
  ip_config_name     = "vm2-ipconfig"
  backend_pool_id    = module.load_balancer.backend_pool_id
}