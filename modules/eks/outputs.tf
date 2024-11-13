output "cluster_name" {
  value = aws_eks_cluster.eks_cluster.name
}

output "eks_cluster_arn" {
  value = aws_eks_cluster.eks_cluster.arn
}
