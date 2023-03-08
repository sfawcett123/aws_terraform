output "region" {
  description = "AWS region"
  value       = data.aws_region.current.name 
}

output "cluster_name" {
  description = "Kubernetes Cluster Name"
  value       = aws_eks_cluster.eks.name
}

output "endpoint" {
  value = aws_eks_cluster.eks.endpoint
}

output "kubeconfig-certificate-authority-data" {
  value = aws_eks_cluster.eks.certificate_authority[0].data
}
