/* instance creation*/
resource "aws_instance" "web" {
  ami           = data.aws_ami.example.id
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.sg.id]
  /* hare we are allocating security group to ec2 instance (sample) which is created above*/

  tags = {
    Name = var.name /*"sample"*/
  }

}

/* giving provision to run on ssh*/

resource "null_resource" "ansible" {

provisioner "remote-exec" {

  connection {
    type     = "ssh"
    user     = "centos"
    password = "DevOps321"
    host     =aws_instance.web.public_ip
  }


  inline = [
    "sudo labauto ansible",
    "ansible-pull -i localhost, -u https://github.com/Pavani73/roboshop-ansible.git main.yml -e env=dev role_name=${var.name}"
  ]
}
}
/* creating Dns records*/

  resource "aws_route53_record" "www" {
    zone_id = "Z07305171TBQH7CAE4LXV" /* hostedzone id from aws*/
    name    = "${var.name}-dev"
    type    = "A"
    ttl     = 30
    records = [aws_instance.web.private_ip]
  }
/* giving our account ID and AMI ID to create instances*/
data "aws_ami" "example" {
  owners = ["973714476881"]
  most_recent = true
  name_regex = "Centos-8-DevOps-Practice"
}
/* allocating our security group allow-all*/

resource "aws_security_group" "sg" {
  name        = var.name /*"sample"*/
  description = "Allow TLS inbound traffic"

  ingress {

    from_port        = 0
    to_port          = 0
    protocol         = "-1" /* if you give -1 all ports will be open, no security issued*/
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

