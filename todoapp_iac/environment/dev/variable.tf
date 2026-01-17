variable "rg" {
  type = map(object({
    rg_name    = string
    location   = string
    managed_by = optional(string)
    tags       = optional(map(string))
  }))
}
variable "networks" {
  type = map(object({
    name          = string
    location      = string
    rg_name       = string
    address_space = list(string)
    tags          = optional(map(string))
    subnets = optional(map(object({
      name             = string
      address_prefixes = list(string)
    })))
  }))
}

variable "public_ips" {
  type = map(object({
    name                    = string
    location                = string
    rg_name                 = string
    allocation_method       = string
    ddos_protection_mode    = optional(string)
    ddos_protection_plan_id = optional(string)
    edge_zone               = optional(string)
    ip_version              = optional(string)
    sku                     = optional(string)
    sku_tier                = optional(string)
    tags                    = optional(map(string))
  }))
}

variable "key_vault" {
  type = map(object({
    name                          = string
    location                      = string
    rg_name                       = string
    enabled_for_disk_encryption   = optional(bool)
    tenant_id                     = optional(string)
    soft_delete_retention_days    = optional(number)
    purge_protection_enabled      = optional(bool)
    sku_name                      = string
    public_network_access_enabled = optional(bool)

    access_policies = optional(map(object({
      tenant_id               = optional(string)
      object_id               = optional(string)
      key_permissions         = optional(list(string))
      secret_permissions      = optional(list(string))
      storage_permissions     = optional(list(string))
      certificate_permissions = optional(list(string))
    })), {})
  }))
}

variable "secrets" {
  type = map(object({
    name  = string
    value = string
  }))
}

variable "vms" {
  type = map(object({
    nic_name                        = string
    vnet_name                       = string
    rg_name                         = string
    location                        = string
    subnet_name                     = string
    vm_name                         = string
    vm_size                         = string
    admin_username                  = string
    admin_password                  = string
    disable_password_authentication = bool
    config_name                     = string
    source_image_reference = object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    })
  }))
}

variable "mssql_server" {
  type = map(object({
    server_name           = string
    rg_name               = string
    location              = string
    server_login_name     = string
    server_login_password = string
    tags                  = optional(map(string))
  }))
}

variable "mssql_database" {
  type = map(object({
    name         = string
    collation    = string
    license_type = string
    max_size_gb  = number
    sku_name     = string
    enclave_type = string
  }))
}

variable "public_lb" {
  description = "Configuration for Public Load Balancer"
  type = map(object({
    name     = string
    location = string
    rg_name  = string
    sku      = optional(string, "Standard")
    sku_tier = optional(string, "Regional")
    frontend_ip_configs = map(object({
      name      = string
      public_ip = optional(string)
    }))
    tags = optional(map(string))
  }))
  default = {}
}

variable "health_prob" {
  type = map(object({
    name     = string
    protocol = optional(string)
    port     = number
  }))
  default = {}
}

variable "lb_rules" {
  description = "The configuration for Load Balancer Rules"
  type = map(object({
    name                           = string
    protocol                       = string
    frontend_port                  = number
    backend_port                   = number
    frontend_ip_configuration_name = string
    idle_timeout_in_minutes        = optional(number)
    floating_ip_enabled            = optional(bool)
  }))
  default = {}
}