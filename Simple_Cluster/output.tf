#output "region" {
#  value = module.eks.region
#}

#output "cluster_name" {
#  value = module.eks.cluster_name
#}

output "bastion_ip" {
  value = module.bastion.instance.public_ip
}