provider "aws" {
  region = "us-east-1"
}

data "aws_ami" "app_ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

resource "aws_instance" "ec2_ds" {
  ami = data.aws_ami.app_ami.id
  instance_type = "t2.micro"
}

output "amis" {
    value = data.aws_ami.app_ami
}

#https://docs.aws.amazon.com/cli/latest/reference/ec2/describe-instances.html