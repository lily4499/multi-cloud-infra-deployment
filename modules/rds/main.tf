resource "aws_db_instance" "rds_instance" {
  identifier           = var.db_identifier
  allocated_storage    = var.allocated_storage
  storage_type         = var.storage_type
  engine               = var.engine
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  username             = var.username
  password             = var.password
  parameter_group_name = var.parameter_group_name
  publicly_accessible  = var.publicly_accessible
  
 # Free tier requirements
  skip_final_snapshot = var.skip_final_snapshot
  deletion_protection = false

  tags = {
    Name = "MyRDSInstance"
  }
}






