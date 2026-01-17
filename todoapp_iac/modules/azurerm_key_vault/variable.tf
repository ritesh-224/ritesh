variable "key_vault" {
    type = map(object({
        name                        = string
        location                    = string
        rg_name                     = string
        enabled_for_disk_encryption = optional(bool)
        tenant_id                   = optional(string)
        soft_delete_retention_days  = optional(number)
        purge_protection_enabled    = optional(bool)
        sku_name                    = string
        public_network_access_enabled = optional(bool)

        access_policies             = optional(map(object({
            tenant_id               = optional(string)
            object_id               = optional(string)
            key_permissions         = optional(list(string))
            secret_permissions      = optional(list(string))
            storage_permissions     = optional(list(string))
            certificate_permissions = optional(list(string))
        })), {})
    }))
}