resource "aws_eks_cluster" "eks" {
  name     = var.cluster_name 
  role_arn = aws_iam_role.example.arn

  vpc_config {
    subnet_ids = [for s in aws_subnet.cluster_subnets : s.id]
  }

  enabled_cluster_log_types = ["api", "audit"]

  depends_on = [
    aws_iam_role_policy_attachment.example-AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.example-AmazonEKSVPCResourceController,
    aws_cloudwatch_log_group.example,
  ]
}
