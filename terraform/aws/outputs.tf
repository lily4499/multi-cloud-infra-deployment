
#EC2

output "instance_ids" {
  description = "The IDs of the EC2 instances"
  value       = module.ec2.instance_ids
}

output "public_ips" {
  description = "The public IP addresses of the EC2 instances"
  value       = module.ec2.public_ips
}


#ECR

output "ecr_repository_url" {
  value = module.ecr.ecr_repo_url
}




#EKS

# Outputs for resources created by the modules

output "cluster_name" {
  value = module.eks.cluster_name
}

output "eks_cluster_arn" {
  value = module.eks.eks_cluster_arn
}



#RDS

output "db_instance_endpoint" {
  description = "The endpoint of the RDS instance"
  value       = module.rds.db_instance_endpoint
}

output "db_instance_arn" {
  description = "The ARN of the RDS instance"
  value       = module.rds.db_instance_arn
}

