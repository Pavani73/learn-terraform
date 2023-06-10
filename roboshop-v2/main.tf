module "instances"{
  for_each = var.instances
  source = "./ec2"
  name = each.key
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.example.id
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.sg.id] /* hare we are allocating security group to ec2 instance (sample) which is created above*/

  tags = {
    Name = var.instances /*"sample"*/
  }

}
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
    "ansible-pull -i localhost, -u https://github.com/Pavani73/roboshop-ansible.git main.yml -e env=dev role_name=${var.instances}"
  ]
}
}
  resource "aws_route53_record" "www" {
    zone_id = "Z07305171TBQH7CAE4LXV" /* hostedzone id from aws*/
    name    = "${var.instances}-dev"
    type    = "A"
    ttl     = 30
    records = [aws_instance.web.private_ip]
  }

variable "instances" {

  default = {

    frontend ={}
    mongodb ={}
    cart ={}
    rabbitmq ={}
    user ={}
    catalogue ={}
    shipping ={}
    payment = {}
    redis ={}
    mysql ={}

  }
}
