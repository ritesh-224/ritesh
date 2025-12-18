variable "vms" {
  type     = map(object({
    nic_name       = string
    vnet_name      = string
    rg_name        = string
    location       = string
    subnet_name    = string
    vm_name        = string
    vm_size        = string
    admin_username      = string
    admin_password      = string
    disable_password_authentication = bool
    config_name    = string
    source_image_reference = object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    })
  }))
}