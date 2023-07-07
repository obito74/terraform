#run the command terraform validate.
provider "aws" {
  profile = "default"
}

resource "aws_instance" "name1" {
  ami           = "ami-07dff4fe919dee33e"
  instance_type = var.instancetype
}

/*
error when running terraform validate
│ Error: Reference to undeclared input variable
│
│   on terraform-validate.tf line 8, in resource "aws_instance" "name1":
│    8:   instance_type = var.instancetype
│
│ An input variable with the name "instancetype" has not been declared. This variable can be declared with a variable "instancetype" {} block.
*/