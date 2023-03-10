variable subnet_id {
    type = string
    description = "Subnet ID (Mandatory)"
}

variable "vpc_id" {
   type = string
   description = "VPC ID (Mandatory)"
}

variable "name" {
   type = string
   description = "Name (Optional)"
   default = "EC2 Instance"
}

variable "default_tags" {
    type = map
    description = "Default Tags [Optional]"
    default = {
        environment_type = "Dev Environment"
    }
}

variable ami_name {
    type = string
    description = "AMI Name (Optional) Defaults to ubuntu"
    default = "ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"
}

