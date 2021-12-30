variable "first_name" {
  type = set(string)
  default = ["Jan", "Kees"]
}

variable "first_last_name" {
  default = {
    "Jan" : "Janssen",
    "Kees" : "Bakker"
  }
}
