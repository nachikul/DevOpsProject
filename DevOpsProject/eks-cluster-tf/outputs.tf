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