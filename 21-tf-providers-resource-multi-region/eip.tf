resource "aws_eip" "useip" {
  domain = "vpc"
}

resource "aws_eip" "mumbaieip" {
  domain = "vpc"
  provider = aws.mumbai
}