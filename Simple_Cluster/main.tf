module "vpc" {
    source = "../modules/vpc"
}

module "bastion" {
    source = "../modules/subnet"

    name = "Bastion"
    vpc_id = module.vpc.vpc_id
  
    subnet_cidrs = [ "10.0.1.0/24" ]
}

module "cluster" {
    source = "../modules/subnet"
 
    name = "Cluster"
    vpc_id = module.vpc.vpc_id

    subnet_cidrs = [ "10.0.2.0/24" , "10.0.3.0/24" , "10.0.4.0/24" ]
}

module "instance" {
    source = "../modules/instances"

    name = "Bastion"
    vpc_id = module.vpc.vpc_id
    subnet_id = module.bastion.subnets[0].id

    depends_on = [ module.bastion ]
}

module "eks" {
    source = "../modules/cluster"

    vpc_id = module.vpc.vpc_id
    cluster_subnets= module.cluster.subnets[*]

    depends_on = [ module.cluster ]
}

module "config" {
    source = "../modules/kubernetes-config"
    cluster_name = module.eks.cluster_name
}
