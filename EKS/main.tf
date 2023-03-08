# Call our simple VPC module
data "aws_region" "current" {}

resource "aws_cloudwatch_log_group" "example" {
  name              = "/aws/eks/${var.cluster_name}/cluster"
  retention_in_days = 1
}

module "vpc" {
    source = "../modules/vpc"
}

module "subnet" {
    source = "../modules/subnet"
    vpc_id = module.vpc.vpc_id
}

module "instance" {
    source = "../modules/instances"
    vpc_id = module.vpc.vpc_id
    subnet_id = module.subnet.subnet_id[0]
}