resource "aws_eks_cluster" "eks_cluster" {
  name     = var.eks_cluster_name
  role_arn = aws_iam_role.eks_cluster_role.arn

  vpc_config {
    subnet_ids                     = [aws_subnet.private_subnet_1.id, aws_subnet.private_subnet_2.id, aws_subnet.private_subnet_3.id]
    endpoint_private_access         = true
    endpoint_public_access          = false
    security_group_ids              = [aws_security_group.eks_security_group.id]
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_cluster_policy,
    aws_iam_role_policy_attachment.eks_service_policy
  ]

  version = var.eks_cluster_version
}

# Managed Node Group for EKS Cluster
resource "aws_eks_node_group" "eks_node_group" {
  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_group_name = "eks-workers"
  node_role_arn       = aws_iam_role.eks_worker_role.arn
  subnet_ids      = [aws_subnet.private_subnet_1.id, aws_subnet.private_subnet_2.id, aws_subnet.private_subnet_3.id]

  scaling_config {
    desired_size = var.desired_size
    max_size     = var.max_size
    min_size     = var.min_size
  }

  instance_types = ["t3.medium"]

  depends_on = [
    aws_iam_role_policy_attachment.worker_node_policy,
    aws_iam_role_policy_attachment.cni_policy,
    aws_iam_role_policy_attachment.ec2_policy
  ]
}

# Output EKS Cluster Information
output "cluster_endpoint" {
  description = "The EKS cluster endpoint"
  value       = aws_eks_cluster.eks_cluster.endpoint
}

output "cluster_name" {
  description = "The name of the EKS cluster"
  value       = aws_eks_cluster.eks_cluster.name
}

output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.eks_vpc.id
}

output "private_subnets" {
  description = "The private subnet IDs"
  value       = [aws_subnet.private_subnet_1.id, aws_subnet.private_subnet_2.id, aws_subnet.private_subnet_3.id]
}