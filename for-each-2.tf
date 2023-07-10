resource "aws_instance" "myec2" {
  ami = "ami-aoidpoaidpoa"
  for_each = {
    key1 = "t2.micro"
    key2 = "t2.medium"
  }
  instance_type = each.value
  key_name      = each.key
  tags = {
    Name = each.value
  }
}