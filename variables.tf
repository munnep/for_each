variable "first_name" {
  default = ["Jan", "Kees"]
}

variable "first_last_name" {
  default = {
    "Jan" : "Janssen",
    "Kees" : "Bakker"
  }
}
