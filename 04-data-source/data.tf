
# aws ec2 instance price data source terraform
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ec2_spot_price
#(this link belongs to below code, it explains each and every argument)

data "aws_ec2_spot_price" "example" {
  instance_type     = "t3.medium"
  availability_zone = "us-east-1a"

  filter {
    name   = "product-description"
    values = ["Linux/UNIX"]
  }
}

output "price"{
  value = data.aws_ec2_spot_price.example.spot_price
}
# https://registry.terraform.io/providers/hashicorp/aws/4.7.0/docs/data-sources/security_group
# this link belongs to below code, it explains each and every argument)
data "aws_security_group" "selected" {
  name = "allow-all"
}

output "sgid"{
  value = data.aws_security_group.selected.id
}

data "aws_ami" "example" {
  owners           = ["973714476881"]
  most_recent      = true
  name_regex       = "Centos-8-DevOps-Practice "
 }
output "ami" {
  value = data.aws_ami.example.id
}
provider "aws"{
  region = "us-east-1"
}