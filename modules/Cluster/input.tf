variable cluster_subnets {
    description = "List of Subnets (Mandatory)"
}

variable "vpc_id" {
   type = string
   description = "VPC ID (Mandatory)"
}

variable "ec2_role_name" {
   type = string
   description = "Bastion Role Name (Optional)"
   default = ""
}

variable "name" {
   type = string
   description = "Name (Optional)"
   default = "Cluster"
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

