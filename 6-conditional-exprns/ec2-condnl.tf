provider "aws" {
  region = "us-east-1"
}


resource "aws_instance" "dev" {
  ami = "ami-01bc990364452ab3e"
    instance_type  = "t2.micro"
    count = var.istest ? 1 : 0
}

resource "aws_instance" "prod" {
  ami = "ami-01bc990364452ab3e"
    instance_type  = "t2.large"
    count = var.istest == false ? 1 : 0
}