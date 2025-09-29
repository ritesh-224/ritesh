variable "nic_name" {
  description = "Name for the NIC resource"
  type        = string
}

variable "vm_name" {
  description = "Name for the VM resource"
  type        = string
}

variable "nic_config_name" {
  description = "Name for the NIC IP configuration"
  type        = string
}

variable "location" {
  description = "The location where the resources will be created."
  type        = string
}

variable "rg_name" {
  description = "The name of the resource group."
  type        = string
}

variable "admin_username" {
  description = "The admin username for the virtual machine."
  type        = string
}

variable "admin_password" {
  description = "The admin password for the virtual machine."
  type        = string
  sensitive   = true
}

variable "subnet_id" {
  description = "The ID of the subnet where the NIC will be created."
  type        = string
}