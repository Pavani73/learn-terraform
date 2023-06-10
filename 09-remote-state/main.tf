terraform {
  backend "s3" {
    bucket = "terraform-73"
    key    = "sample/terraform.tfstate"
    region = "us-east-1"
  }
}

output "demo"{
  value = "hello world"
}
/* in this code we are not giving any