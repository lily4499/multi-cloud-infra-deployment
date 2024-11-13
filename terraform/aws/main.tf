# Main Terraform configuration for using modules


# EC2 Instance Module
module "ec2" {
  source = "../../modules/ec2"
  aws_region         = var.aws_region
  instance_type = var.instance_type
  ami_id        = var.ami_id
  key_name      = var.key_name
  instance_count       = var.instance_count
  security_group_ids   = var.security_group_ids
}

# ECR Repository
module "ecr" {
  source = "../../modules/ecr"
  ecr_repo_name = var.ecr_repo_name

}

# IAM Module for EKS Roles
module "iam" {
  source           = "../../modules/iam"
 
}

# EKS Cluster Module
module "eks" {
  source           = "../../modules/eks"
  eks_cluster_name = var.eks_cluster_name
  subnet_ids       = var.subnet_ids
  cluster_role_arn = module.iam.cluster_role_arn
  node_role_arn    = module.iam.node_role_arn
  
}


#AWS RDS

module "rds" {
  source               = "../../modules/rds"
  db_identifier        = var.db_identifier
  allocated_storage    = var.allocated_storage
  storage_type         = var.storage_type
  engine               = var.engine
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  username             = var.username
  password             = var.password
  parameter_group_name = var.parameter_group_name
  publicly_accessible  = var.publicly_accessible
  skip_final_snapshot  = var.skip_final_snapshot
}

