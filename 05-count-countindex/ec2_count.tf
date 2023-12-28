provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "ec2_count" {
  ami           = "ami-01bc990364452ab3e"
  instance_type = "t2.micro"
  count         = 3
  tags = {
    Name = "ec2-${count.index + 1}"
  }
}
