variable vpc_cider {
  type        = string
  #default     = ""
  description = "The CIDR block of the VPC"
}

variable env {
  type        = string
  default     = "dev"
  description = "description"
}


variable ssh_port {
  description = "Port for SSH access"
  type        = number
  default     = 22
}

variable app_port {
  description = "Port for application access"
  type        = number
  default     = 3000
}

variable subnets_list {
  type        = list(object({
    name = string ,
    cidr = string ,
    type = string ,
    zone = string
  }))
}

