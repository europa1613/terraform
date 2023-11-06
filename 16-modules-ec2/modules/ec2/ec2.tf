resource "aws_instance" "ec2_module" {
  ami = "ami-01bc990364452ab3e"
  instance_type = var.instance_type
}