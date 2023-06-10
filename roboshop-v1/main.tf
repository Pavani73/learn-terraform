module "frontend"{
  source = "./ec2"
  name = "frontend"
}
module "catalogue"{
  source = "./ec2"
  name = "catalogue"
}

module "mongodb" {
  source = "./ec2"
  name = "mongodb"

}
module "user"{
  source = "./ec2"
  name = "user"
}
module "cart"{
  source = "./ec2"
  name = "cart"
}
module "mysql"{
  source = "./ec2"
  name = "mysql"
}
module "redis"{
  source = "./ec2"
  name = "redis"
}


module "shipping"{
  source = "./ec2"
  name = "shipping"
}
module "payment"{
  source = "./ec2"
  name = "payment"
}
module "dispatch"{
  source = "./ec2"
  name = "dispatch"
}
module "rabbitmq"{
  source = "./ec2"
  name = "rabbitmq"
}
