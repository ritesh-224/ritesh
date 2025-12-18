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