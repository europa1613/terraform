provider "aws" {
  region = "us-east-1"
}


resource "aws_instance" "ec2_datatype" {
  ami           = "ami-01bc990364452ab3e"
  instance_type = "t2.micro"
  host_id = var.id #just picked random
}
