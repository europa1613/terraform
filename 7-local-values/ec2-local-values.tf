provider "aws" {
  region = "us-east-1"
}

locals {
  common_tags = {
    owner = "my ec2"
    service = "backend"
  }
}


resource "aws_instance" "ec2_acc" {
  ami = "ami-01bc990364452ab3e"
    instance_type  = "t2.micro"
    tags = local.common_tags
}

resource "aws_instance" "ec2_db" {
  ami = "ami-01bc990364452ab3e"
    instance_type  = "t2.large"
    tags = local.common_tags
}