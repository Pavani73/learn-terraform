module "instances"{
  for_each = var.instances
  source = ""
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