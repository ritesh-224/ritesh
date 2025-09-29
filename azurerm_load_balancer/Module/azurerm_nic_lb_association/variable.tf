variable "nic_id" {
  description = "The ID of the Network Interface"
  type        = string
}

variable "ip_config_name" {
  description = "The name of the IP configuration"
  type        = string
}

variable "backend_pool_id" {
  description = "The ID of the Backend Address Pool"
  type        = string
}
