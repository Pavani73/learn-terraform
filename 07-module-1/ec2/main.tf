/* creating instance with name sample*/
resource "aws_instance" "web" {
  ami           = data.aws_ami.example.id
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.sg.id] /* hare we are allocating security group to ec2 instance (sample) which is created above*/

  tags = {
    Name = var.name /*"sample"*/
  }
}
/* here we are giving our AMI details */
data "aws_ami" "example" {
  owners = ["973714476881"]
  most_recent = true
  name_regex = "Centos-8-DevOps-Practice"
}
output "ami" {
  value = data.aws_ami.example.id
}
/* security group creation*/
resource "aws_security_group" "sg" {
  name        = var.name /*"sample"*/
  description = "Allow TLS inbound traffic"

  ingress {
    description      = "ssh"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"] /* we are giving access to outside world*/

  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = var.name /*"sample"*/
  }
}

variable "name"{}