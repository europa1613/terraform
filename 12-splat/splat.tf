provider "aws" {

}

resource "aws_iam_user" "iam_lb" {
  name  = "tf_iamuser_splat_${count.index}"
  path  = "/system/"
  count = 3
}

output "iam_lb_arns" {
  value = aws_iam_user.iam_lb[*].arn
}
