data "aws_region" "current" {}

locals {
   tags = {
        Name = var.name
   }
}