terraform {
  backend "s3" {
    bucket         = "burger-box-db-btf"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}