provider "aws" {
  
}

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "single-instance"

  instance_type          = "t2.micro"
  #key_name               = "user1"
  #monitoring             = true
  #vpc_security_group_ids = ["sg-12345678"]
  subnet_id              = "subnet-0c5747b0180790055"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}