data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = [ var.ami_name ]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

data "aws_subnet" "selected" {
  id = var.subnet_id
}

data "aws_internet_gateway" "default" {
  filter {
    name   = "attachment.vpc-id"
    values = [var.vpc_id]
  }
}

locals {
   tags = {
        Name = var.name
   }
}
