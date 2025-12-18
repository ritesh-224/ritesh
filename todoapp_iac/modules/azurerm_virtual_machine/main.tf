resource "azurerm_network_interface" "nic" {
    for_each = var.vms
    name                = each.value.subnet_name == "subnet1" ? "nic1" : "nic2"          #each.value.nic_name
    location            = each.value.location
    resource_group_name = each.value.rg_name

    ip_configuration {

    name                           = "ipconfig1"
    subnet_id                      = data.azurerm_subnet.subnet[each.key].id
    private_ip_address_allocation  = "dynamic"
    private_ip_address_version     = lookup(each.value, "private_ip_address_version", "IPv4")
    public_ip_address_id           = lookup(each.value, "public_ip_address_id", null)
    }
  }


resource "azurerm_linux_virtual_machine" "example" {
  for_each = var.vms
  name                = each.value.vm_name
  resource_group_name = each.value.rg_name
  location            = each.value.location
  size                = each.value.vm_size
  disable_password_authentication = lookup(each.value, "disable_password_authentication", false)
  admin_username      = each.value.admin_username
  admin_password      = each.value.admin_password
  network_interface_ids = [
    azurerm_network_interface.nic[each.key].id,
  ]

  # admin_ssh_key {
  #   username   = "adminuser"
  #   public_key = file("~/.ssh/id_rsa.pub")
  # }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = each.value.source_image_reference.publisher
    offer     = each.value.source_image_reference.offer
    sku       = each.value.source_image_reference.sku
    version   = each.value.source_image_reference.version
  }
}