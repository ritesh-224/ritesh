variable "nic_prefix" {
  description = "Prefix for all NIC resources"
  type        = string
}

variable "vm_prefix" {
  description = "Prefix for all VM resources"
  type        = string 
  
}

variable "ip_prefix" {
  description = "Prefix for all IP resources"
  type        = string 
}

variable "os_prefix" {
  description = "Prefix for all OS resources"
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