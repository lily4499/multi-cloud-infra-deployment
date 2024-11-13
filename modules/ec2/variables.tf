variable "aws_region" {}

variable "ami_id" {}

variable "security_group_ids" {
  description = "Security group IDs for the instance"
  type        = list(string)
  default     = ["sg-091906568d27d3894"]  # Example security group ID
}

variable "key_name" {}

variable "instance_count" {
  type    = number
  default = 1
}
variable "instance_type" {}
