provider "aws" {

    region = "us-east-1"
    

}

resource "aws_instance" "myec2" {
    ami = "ami-022e1a32d3f742bd8"
    instance_type = "t2.micro"

    tags = {
      Name = "my-first-ec2"
  }
}