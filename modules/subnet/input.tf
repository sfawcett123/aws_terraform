variable "subnet_cidrs" {
  type        = list(string)
  description = "Subnet CIDR values"
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "vpc_id" {
   type = string
   description = "VPC ID (Mandatory)"
}

variable "default_tags" {
    type = map
    description = "Default Tags [Optional]"
    default = {
        environment_type = "Dev Environment"
    }
}
