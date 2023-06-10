module "instances"{
  for_each = var.instances
  source = ""
  name = each.key
}