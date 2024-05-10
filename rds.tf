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
  
  db_subnet_group_name = aws_db_subnet_group.subnet_group.name

  vpc_security_group_ids = [aws_security_group.security_group.id]

  skip_final_snapshot = true
}

resource "aws_db_subnet_group" "subnet_group" {
  name       = "burger-box-db-sb"
  subnet_ids = ["subnet-0b2507e8acdbc95f0", "subnet-05422e17fe674db83"]  # IDs das subnets onde o RDS estará localizado
}

resource "aws_security_group" "security_group" {
  name        = "burger-box-db-sg"
  description = "Security group for my RDS instance to burger-box"

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["189.89.220.197"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
