output "subnet_ids" {
  description = "Subnet IDs per virtual network"
  value = {
    for vnet_key, vnet in azurerm_virtual_network.vnet :
    vnet_key => {
      for subnet in vnet.subnet :
      subnet.name => subnet.id
    }
  }
}