provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "mytf_ec2" {
    ami = "ami-01bc990364452ab3e"
    instance_type  = "t2.micro"

    tags = {
        "Name" = "my_first_terraform_ec2"
    }
}