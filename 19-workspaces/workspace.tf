provider "aws" {

}

resource "aws_instance" "workspace_ec2" {
  ami           = "ami-01bc990364452ab3e"
  instance_type = lookup(var.instances, terraform.workspace)

}

variable "instances" {
  type = map(any)
  default = {
    default = "t2.nano"
    dev     = "t2.micro"
    prd     = "t2.large"
  }
}

# terraform workspace -h
# terraform workspace show
# terraform workspace new dev
# terraform workspace new prd
# terraform workspace list
# terraform workspace select dev
