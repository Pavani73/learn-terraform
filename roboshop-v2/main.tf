
module "instances"{
  for_each = var.instances
  source = "./ec2"  // here it access data from roboshop-v2/ec2/main.tf
  name = each.key
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