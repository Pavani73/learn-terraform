variable "class"{

  default = "devops"
}

 output "class"{
   value = upper(var.class)
 }
variable "fruits"{
  default = ["apple","banana","orange"]
}

output "fruits_count" {
      value = length(var.fruits)
}
variable "classes"{

  default = {
    devops = {
      name = "devops"
      topics = ["jenkins", "dockers"]
    }
   aws = {
     name = "aws"
   }
  }
}
output "devops_topics" {
    value = var.classes["devops"]["topics"]
}

output "aws_topics"{

  value = lookup(var.classes, "aws", null)
}
