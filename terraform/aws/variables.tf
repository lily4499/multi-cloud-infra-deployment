# Define variables for the Terraform configuration

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}



#AWS EC2

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.medium"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "key_name" {
  description = "Key pair name for EC2 instances"
  type        = string
}

variable "security_group_ids" {
  type = list(string)
}

variable "instance_count" {
  type    = number
  default = 1
}


#ECR

variable "ecr_repo_name" {
  description = "Name of the ECR repository"
  type        = string
  default     = "my-app-repo"
}

#EKS_CLUSTER

variable "eks_cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "eks-cluster"
}

variable "subnet_ids" {
  description = "List of subnet IDs to use for the EKS cluster"
  type        = list(string)
  default     = ["subnet-00f1308ab05d4d97a", "subnet-062bafb72ff1b9c71"]
}


#RDS


variable "db_identifier" {
  description = "Unique name for the RDS instance"
  type        = string
  default     = "mydemodb"
}

variable "allocated_storage" {
  description = "The storage size for the RDS instance"
  type        = number
  default     = 20
}

variable "storage_type" {
  description = "The storage type for the RDS instance"
  type        = string
  default     = "gp2"
}

variable "engine" {
  description = "Database engine"
  type        = string
  default     = "mysql"
}

variable "engine_version" {
  description = "Database engine version"
  type        = string
  default     = "5.7"
}

variable "instance_class" {
  description = "The instance type for the RDS instance"
  type        = string
  default     = "db.t2.micro"
}

variable "username" {
  description = "Username for the master RDS user"
  type        = string
  default     = "admin"
}

variable "password" {
  description = "Password for the master RDS user"
  type        = string
  default     = "abc123"
  sensitive   = true
}

variable "parameter_group_name" {
  description = "The parameter group name for the RDS instance"
  type        = string
  default     = "default.mysql5.7"
}

variable "publicly_accessible" {
  description = "Whether the RDS instance is publicly accessible"
  type        = bool
  default     = true
}

variable "skip_final_snapshot" {
  description = "Whether to skip the final snapshot when deleting the RDS instance"
  type        = bool
  default     = true
}
