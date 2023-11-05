provider "aws" {
  region = "us-east-1"
}

variable "sg_ports" {
  type    = list(number)
  default = [8200, 8201, 8300, 9200, 9500]
}

resource "aws_security_group" "tf-dyn-blk-sg" {
  name = "tf-dynamic-block-sg"

  dynamic "ingress" {
    for_each = var.sg_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

  }
  dynamic "egress" {
    for_each = var.sg_ports
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

  }

  tags = {
    Name = "tf-dynamic-block-sg"
  }

}
