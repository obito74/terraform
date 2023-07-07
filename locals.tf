#local vaules
#simplifies your Terraform configuration – since you can reference the local multiple times, you reduce duplication in your code

locals {
    common_tags = {
        Owner = "devops team"
        service = "backend"
    }
}

resource "aws_instance" "dev-app" {
    ami = "ami-example"
    instance_type = "t2.micro"
    tags = local.common_tags
}

resource "aws_ebs_volume" "db_ebs" {
    availability_zone = "us-east-1a"
    size = 8
    tags = local.common_tags
}