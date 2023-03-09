output "region" {
    value = data.aws_region.current.name
}

output "cluster_name" {
    value = var.name
}

output "endpoint" {
    value = aws_eks_cluster.eks.endpoint
}

output "cluster_ca_certificate" {
    value = base64decode(aws_eks_cluster.eks.certificate_authority[0].data)
}
