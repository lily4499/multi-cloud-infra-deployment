//variable "aws_region" {}

variable "db_identifier" {
  description = "Unique name for the RDS instance"
  type        = string
}

variable "allocated_storage" {
  description = "The storage size for the RDS instance"
  type        = number
}

variable "storage_type" {
  description = "The storage type for the RDS instance"
  type        = string
}

variable "engine" {
  description = "Database engine"
  type        = string
}

variable "engine_version" {
  description = "Database engine version"
  type        = string
}

variable "instance_class" {
  description = "The instance type for the RDS instance"
  type        = string
}

variable "username" {
  description = "Username for the master RDS user"
  type        = string
}

variable "password" {
  description = "Password for the master RDS user"
  type        = string
  sensitive   = true
}

variable "parameter_group_name" {
  description = "The parameter group name for the RDS instance"
  type        = string
}

variable "publicly_accessible" {
  description = "Whether the RDS instance is publicly accessible"
  type        = bool
}

variable "skip_final_snapshot" {
  description = "Whether to skip the final snapshot when deleting the RDS instance"
  type        = bool
}
