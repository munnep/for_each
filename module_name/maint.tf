
variable "first_name" {}
variable "last_name" {}

resource "null_resource" "name" {
  provisioner "local-exec" {
    command = "echo From the module: First name is ${var.first_name} last name is not ${var.last_name}"
  }
}