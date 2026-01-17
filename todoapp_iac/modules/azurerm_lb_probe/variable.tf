variable "health_prob" {
  description = "The configuration for Load Balancer Health Probe"
  type = map(object({
    name     = string
    protocol = optional(string)
    port     = number
  }))
  default = {}
}

variable "loadbalancer_id" {
  type = string
}