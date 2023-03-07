resource "aws_eks_node_group" "node_1" {
  cluster_name    = aws_eks_cluster.eks.name
  node_group_name = "node_1"
  node_role_arn   = aws_iam_role.node_group_1.arn
  subnet_ids      = [for s in aws_subnet.cluster_subnets : s.id]

  scaling_config {
    desired_size = 1
    max_size     = 2
    min_size     = 1
  }

  update_config {
    max_unavailable = 1
  }

  depends_on = [
    aws_iam_role_policy_attachment.example-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.example-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.example-AmazonEC2ContainerRegistryReadOnly,
  ]
}
