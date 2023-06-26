provider "aws" {

    region = "us-east-1"
    access_key = "AKIAWCSZMV7S562LIPSO"
    secret_key = "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"

}

resource "aws_instance" "myec2" {
    ami = "ami-022e1a32d3f742bd8"
    instance_type = "t2.micro"

    tags = {
      Name = "my-first-ec2"
  }
}