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

variable "loadbalancer_id" {
  type = string
}

variable "backend_pool_id" {
  type = list(string)
}

variable "probe_id" {
  type = string
}