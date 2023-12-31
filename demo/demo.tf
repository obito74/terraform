terraform {
    required_providers {
      aws = {
        source =  "hashicorp/aws"
        version = "~> 4.0"
      }
    }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "myec2" {
    ami = ami-123
    instance_type = "t2.micro"
}