variable "lb_name" {
  description = "The name of the Load Balancer."
  type        = string 
}

variable "rg_name" {
  description = "The name of the resource group in which to create the Load Balancer."
  type        = string
}

variable "location" {
  description = "The location where the Load Balancer will be created."
  type        = string
}

variable "public_ip" {
  description = "The public IP address to associate with the Load Balancer."
  type        = string
}