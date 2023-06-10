resource "aws_instance" "web" {
  count = length(var.instance)
  ami           = data.aws_ami.example.id
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld-${count.index}"
  }
}

data "aws_ami" "example" {

  owners = ["973714476881"]
  most_recent = true
  name_regex = "Centos-8-DevOps-Practice"
}
output "ami" {
  value = data.aws_ami.example.id
}

variable "instances" {

  default = ["frontend", "catalogue", "cart"]
}