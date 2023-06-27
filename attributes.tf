provider "aws" {
  profile = "default"
}

#resource name = aws_eip
#name given to this resource = lb
resource "aws_eip" "lb" {
    domain = "vpc"
}

#you can refer to the resource block by aws_eip.lb

output "eip" {
    value = aws_eip.lb.public_ip
}

resource "aws_s3_bucket" "mys3"{
    bucket = "brett-attribute-demo-001"
}

output "mys3bucket" {
    value = aws_s3_bucket.mys3.bucket_domain_name
}
