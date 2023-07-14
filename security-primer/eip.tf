resource "aws_eip" "eip01" {
    domain = "vpc"
}

resource "aws_eip" "eip" {
    domain = "vpc"
    provider = aws.west
}