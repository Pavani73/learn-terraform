Variable "class"{

  default = "devops"
}
/*print above small letter devops into capital letters */

output"class"{

  value = upper{var.class}
}