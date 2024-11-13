output "instance_ids" {
  description = "The IDs of the EC2 instances"
  value       = aws_instance.webserver[*].id
}

output "public_ips" {
  description = "The public IP addresses of the EC2 instances"
  value       = aws_instance.webserver[*].public_ip
}

