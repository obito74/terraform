provider "aws" {
  region     = "us-west-2"
  access_key = "YOUR-ACCESS-KEY"
  secret_key = "YOUR-SECRET-KEY"
}
resource "aws_iam_user" "lb" {
  name = "iamuser.${count.index}"
  count = 3
  path = "/system/"
}

output "arns" {
  value = aws_iam_user.lb[*].arn #when using the [*], all 3 users will be output on the screen
  #value = aws_iam_user.lb[0].arn. when tf apply is run, only iamuser.0 will be output on the screen
}