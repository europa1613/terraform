provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "myec2_variable" {
    ami = "ami-01bc990364452ab3e"
    instance_type  = var.instancetype
}