variable "bastion_name" {
  description = "Name of the Azure Bastion Host"
  type        = string
}

variable "location" {
  description = "Location for the Azure Bastion Host"
  type        = string
}

variable "rg_name" {
  description = "Resource Group name for the Azure Bastion Host"
  type        = string
}

variable "bastion_subnet_id" {
  description = "ID of the Azure Bastion subnet"
  type        = string
}

variable "bastion_public_ip_id" {
  description = "ID of the Azure Bastion public IP"
  type        = string
}