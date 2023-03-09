# Call our simple VPC module
data "aws_region" "current" {}

module "vpc" {
    source = "../modules/vpc"
}

module "subnet" {
    source = "../modules/subnet"
    vpc_id = module.vpc.vpc_id
  
    subnet_cidrs = [ "10.0.1.0/24" ]
}

module "instance" {
    source = "../modules/instances"
    vpc_id = module.vpc.vpc_id
    subnet_id = module.subnet.subnet_id[0]

    depends_on = [ module.subnet ]
}
