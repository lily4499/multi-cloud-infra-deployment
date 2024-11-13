aws_region         = "us-east-1"

#EC2
ami_id      = "ami-0c7217cdde317cfec"
security_group_ids = ["sg-091906568d27d3894"]
instance_type      = "t2.micro"
key_name           = "ec2-key"
instance_count     = 1

#ECR
ecr_repo_name   = "my-app-repo"


#EKS
eks_cluster_name = "eks-cluster"
subnet_ids      = ["subnet-00f1308ab05d4d97a", "subnet-062bafb72ff1b9c71"]


#RDS
db_identifier     = "mydemodb"
allocated_storage = 20
storage_type      = "gp2"
engine            = "mysql"
engine_version    = "8.0"
instance_class    = "db.t3.micro"
username          = "admin"
password          = "abc123abc"
parameter_group_name = "default.mysql8.0"
publicly_accessible  = true
skip_final_snapshot  = true

