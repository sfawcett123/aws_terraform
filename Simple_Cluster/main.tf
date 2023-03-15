module "vpc" {
  source = "../modules/vpc"
}

module "bastion_subnet" {
  source = "../modules/subnet"

  name   = "Bastion"
  vpc_id = module.vpc.vpc_id

  subnet_cidrs = ["10.0.1.0/24"]
}

module "cluster_subnet" {
    source = "../modules/subnet"

    name = "Cluster"
    vpc_id = module.vpc.vpc_id

    subnet_cidrs = [ "10.0.2.0/24" , "10.0.3.0/24" , "10.0.4.0/24" ]
}

module "bastion" {
  source = "../modules/instances"

  name      = "Bastion"
  vpc_id    = module.vpc.vpc_id
  subnet_id = module.bastion_subnet.subnets[0].id
}

module "eks" {
    source = "../modules/cluster"

    vpc_id = module.vpc.vpc_id
    cluster_subnets= module.cluster_subnet.subnets

    ec2_role_name =  module.bastion.role_name
}
