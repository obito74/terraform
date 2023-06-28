#creating ec2, eip, and security group with cross-account resource attributes. 
#assigning the created eip to the ec2 instance and security group

provider "aws" {

  profile = "default"

}

 resource "aws_instance" "myec2" {

    ami = "ami-022e1a32d3f742bd8"
    instance_type = "t2.micro"

    tags = {

      Name = "my-first-ec2-instance"

  } 

}

resource "aws_eip" "lb" {

    domain = "vpc"

}

resource "aws_eip_association" "eip_assoc" {
  #instance_id references ec2 instance id
  instance_id   = aws_instance.myec2.id
  #allocation_id references the eip id
  allocation_id = aws_eip.lb.id

}

resource "aws_security_group" "allow_tls" {
  name        = "brettg-security-group-01"

  ingress {
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["${aws_eip.lb.public_ip}/32"]
  }
}

