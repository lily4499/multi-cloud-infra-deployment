resource "aws_instance" "webserver" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  count                  = var.instance_count
  key_name               = var.key_name
  vpc_security_group_ids       = var.security_group_ids
 
  tags = {
    Name = "webserver-${count.index}"
  }
}
