module "vpc" {
    source = "../modules/vpc"
}

module "bastion" {
    source = "../modules/subnet"

    name = "Bastion"
    vpc_id = module.vpc.vpc_id
  
    subnet_cidrs = [ "10.0.1.0/24" ]
}

module "instance" {
    source = "../modules/instances"

    name = "Bastion"
    vpc_id = module.vpc.vpc_id
    subnet_id = module.bastion.subnets[0].id

    depends_on = [ module.bastion ]
}
