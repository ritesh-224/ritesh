variable "public_lb" {
  description = "Configuration for Public Load Balancer"
  type = map(object({
    name               = string
    location           = string
    rg_name            = string
    sku                = optional(string, "Standard")
    sku_tier           = optional(string, "Regional")   
    frontend_ip_configs = map(object({
      name                 = string
      public_ip = optional(string)
    }))
    tags = optional(map(string))
  }))
  default = {}
}

# variable "pip_name" {
#   description = "The name of the Public IP"
#   type        = string
# }

# variable "rg_name" {
#   description = "The name of the Resource Group"
#   type        = string  
# }

variable "public_ip" {
  type = string
}