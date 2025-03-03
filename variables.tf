variable vpc_cider {
  type        = string
  #default     = ""
  description = "The CIDR block of the VPC"
}

variable public_subnet_cidr{
  type        = string
  #default     = ""
  description = "public subnet cider"
}
variable private_subnet_cidr {
  type        = string
  #default     = ""
  description = "private subnet cider"
}
variable env {
  type        = string
  default     = "dev"
  description = "description"
}

variable ami {
  type        = string
}
variable instance_type {
  type        = string
  default     = ""
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
variable region {
  type        = string
}
variable new_count{
  type        = number
}
variable subnets_list {
  type        = list(object({
    name = string ,
    cidr = string ,
    type = string ,
    zone = string
  }))
}

variable list_of_ec2s {
  type        = list (object({
    ec2_tier =string,
    name =string,
    ami =string
  }))
}

