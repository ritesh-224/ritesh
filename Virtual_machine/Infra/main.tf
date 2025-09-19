module "resource_group" {
  source              = "../Module/resource_group"
  rg_name             = "motu-rg"
  location            = "East US"
}

module "virtual_network" {
  depends_on = [ module.resource_group ]
  source              = "../Module/virtual_network"
  vnet_name           = "motu-vnet"
  vnet_address_space  = ["10.0.0.0/16"]
  location            = "East US"
  rg_name             = "motu-rg"
}         

module "subnet" {
  depends_on = [ module.virtual_network, module.resource_group  ]
  source              = "../Module/subnet"
  subnet_name         = "vm1-subnet"
  rg_name             = "motu-rg"
  vnet_name           = "motu-vnet"
  address_prefixes    = ["10.0.1.0/24"] 
}

module "key_vault" {
  depends_on = [ module.resource_group ]
  source              = "../Module/key_vault"
  key_vault_name      = "motu-kv"
  location            = "East US"
  rg_name             = "motu-rg" 
}

module "password" {
  depends_on = [ module.key_vault, module.resource_group ]
  source              = "../Module/vault_secret"
  secret_name         = "password"
  secret_value        = "Ritesh@12345"
  key_vault_id        = module.key_vault.key_vault_id
}

module "public_ip1" {
  depends_on = [ module.resource_group ]
  source              = "../Module/public_ip"
  pip_name            = "vm1-pip"
  rg_name             = "motu-rg"
  location            = "East US"
}  

module "azure_vm1" {
  depends_on = [ module.subnet, module.password, module.resource_group, module.virtual_network ]
  source              = "../Module/azure_vm"
  vm_prefix             = "motu-vm1"
  location            = "East US"
  rg_name             = "motu-rg"
  nic_prefix          = "vm1"
  ip_prefix           = "vm1"
  os_prefix           = "linux"
  admin_username      = "adminuser"
  admin_password      = module.password.secret_value
  subnet_id           = module.subnet.subnet_id
}

# module "azure_vm2" {
#   source              = "../Module/azure_vm"
#   vm_prefix             = "motu-vm2"
#   location            = "East US"
#   rg_name             = "motu-rg"
#   nic_prefix          = "vm2"
#   ip_prefix           = "vm2"
#   os_prefix           = "linux"
#   admin_username      = module.vault_secret.secret_name
#   admin_password      = module.vault_secret.secret_value
#   key_vault_name      = module.key_vault.key_vault_name
# }