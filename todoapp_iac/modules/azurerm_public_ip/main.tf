resource "azurerm_public_ip" "pip" {
    for_each = var.public_ips
    name                  = each.value.name
    location              = each.value.location
    resource_group_name   = each.value.rg_name
    allocation_method     = each.value.allocation_method
    sku                   = lookup(each.value, "sku", "Standard")
    ddos_protection_mode  = lookup(each.value, "ddos_protection_mode", "VirtualNetworkInherited")
    ddos_protection_plan_id = (lookup (each.value, "ddos_protection_mode", "VirtualNetworkInherited") == "Enabled" ? lookup(each.value, "ddos_protection_plan_id", null) : null)
    edge_zone             = lookup(each.value, "edge_zone", null)
    ip_version            = lookup(each.value, "ip_version", "IPv4")
    sku_tier              = lookup(each.value, "sku_tier", "Regional")
    tags                  = lookup(each.value, "tags", {})
}