provider "aws" {

}

data "aws_ami" "ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

#NOTE: Uses default security group
# Explicitly enable ssh on port 22 on default sg
# Add Port 80 inboud rule  to default sg
resource "aws_instance" "ec2_remote_exec" {
  ami           = data.aws_ami.ami.id
  instance_type = "t2.micro"
  key_name      = "tf-key"

  tags = {
    Name = "tf-ec2_remote_exec"
  }

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("./tf-key.pem")
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo amazon-linux-extras install -y nginx1",
      #"sudo yum install -y ngnix",
      "sudo systemctl start nginx"
    ]
  }

}

output "app_ami" {
  value = aws_instance.ec2_remote_exec.ami
}
