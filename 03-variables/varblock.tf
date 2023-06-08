variable "sample" {
  default = 100
}
variable "sample1" {
  default ="hello world"
}
output "sample"{
  value = var.sample
  }

output "sample1"{
  value = var.sample1
}
output "sample-ext" {
  value = "value of sample -${var.sample}"
}
#plain
variable "course" {
  default = "devops training"
}
#list
variable "courses" {

  default = [
    "devops",
    "phython",
    "aws"
  ]
}
#map
variable "course_details"{
  default = {
    devops = {
      name = "devops"
      time = "10am"
      duration = 30
    }
    aws = {
      name ="aws"
      time = "11am"
      duration = 90
    }
  }

}

output "course"{
  value = var.course
}

#output "courses"{
 # value = var.courses
#}

output "courses"{
  value = var.courses[2]
}
#output "course_details"{
#  value = var.course_details
#}
output "course_details"{
 value = var.course_details["devops"]
}