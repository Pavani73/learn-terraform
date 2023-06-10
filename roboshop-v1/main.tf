module "frontend"{
  source = "./ec2"
  name = "frontend"
}

module "mongodb" {
  source = "./ec2"
  name = "mongodb"

}

module "catalogue"{
  source = "./ec2"
  name = "catalogue"
}
module "redis"{
  source = "./ec2"
  name = "redis"
}
module "user"{
  source = "./ec2"
  name = "user"
}
module "mysql"{
  source = "./ec2"
  name = "mysql"
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
module "cart"{
  source = "./ec2"
  name = "cart"
}
module "payment"{
  source = "./ec2"
  name = "payment"
}































output  "public_ip_sample1" {
  value =module.sample1.public_ip
}

output  "public_ip_sample2" {
  value =module.sample1.public_ip /* public_ip is written in ec2 mail.tf file */
}
