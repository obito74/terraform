provider "aws" {
  profile = "default"
}

resource "aws_instance" "name" {
  ami           = "ami-07dff4fe919dee33e"
  instance_type = "t2.micro"
}