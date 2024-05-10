provider "aws" {
  region = "us-east-1"
}

resource "aws_db_instance" "db_instance" {
  identifier           = "burger-box-db"
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "postgres"
  engine_version       = "16.3"
  instance_class       = "db.t3.micro"
  db_name              = "burger_box"
  username             = "user_burger_box"
  password             = "o]K[tOK33.2d"
  
  vpc_security_group_ids = ["${var.sgId}"]

  skip_final_snapshot = true
}
