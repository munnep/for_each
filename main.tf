resource "null_resource" "name" {
  for_each = toset(var.first_name)
  provisioner "local-exec" {
    command = "echo First name is ${each.key} last name is not ${each.value}"
  }
}

resource "null_resource" "name_complete" {
  for_each = var.first_last_name
  provisioner "local-exec" {
    command = "echo First name is ${each.key} last name is ${each.value}"
  }
}

module "name_complete" {
  for_each   = var.first_last_name
  source     = "./module_name"
  first_name = each.key
  last_name  = each.value
}
