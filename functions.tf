provider "aws" {
  region     = var.region
  access_key = "YOUR-ACCESS-KEY"
  secret_key = "YOUR-SECRET-KEY"
}

locals {
    #formatdate = converts a timestamp into a different time format
    #timestamp = returns the current date and time 
  time = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
}

variable "region" {
  default = "ap-south-1"
}

variable "tags" {
  type = list
  default = ["firstec2","secondec2"]
}

variable "ami" {
    #map links an associated region to an ami id
  type = map
  default = {
    "us-east-1" = "ami-0323c3dd2da7fb37d"
    "us-west-2" = "ami-0d6621c01e8c2de2c"
    "ap-south-1" = "ami-0470e33cd681b2476"
  }
}

resource "aws_key_pair" "loginkey" {
  key_name   = "login-key"
  #file = reads the contents of a file at the given path and returns them as a string
  public_key = file("${path.module}/id_rsa.pub")
}

resource "aws_instance" "app-dev" {
    #lookup funciton = retrieves teh value of a single element from a map, given its key. if the given key does not exist, the default value is returned instead 
    #var.ami = references the ami variable
    #var.region = referencing the region variable above
   ami = lookup(var.ami,var.region)
   instance_type = "t2.micro"
   key_name = aws_key_pair.loginkey.key_name
   #count will create 2 ec2 instances
   count = 2

   tags = {
    #element function = retreives a single element from a list
    #var.tags = references the tags variable above
    #count.index = increments the count by 1
     Name = element(var.tags,count.index)
   }
}


output "timestamp" {
  value = local.time
}