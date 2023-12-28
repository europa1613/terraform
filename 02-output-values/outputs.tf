provider "aws" {
  region = "us-east-1"
}

resource "aws_eip" "lb" {
  domain = "vpc"
}

output "eip_output" {
    value = aws_eip.lb
}