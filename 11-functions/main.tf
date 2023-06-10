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

  value = lookup(lookup(var.classes, "aws", null), "topics", "no topics so far")
}

output"fruit_0"{
    value = var. fruits[0]
  //value = var.fruits[4]/* it shows error, there in no 4th value*/
}

output "fruit_4"{
  value = element(var.fruits,4)
}
