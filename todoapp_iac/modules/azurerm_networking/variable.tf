variable "networks" {
    type = map(object({
        name                = string
        location            = string
        rg_name             = string
        address_space       = list(string)
        tags                = optional(map(string))
        subnets             = optional(map(object({
            name            = string
            address_prefixes= list(string)
        })))
    }))   
}

