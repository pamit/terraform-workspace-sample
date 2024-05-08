variable "filename" {
  type = string
  default = ""
}

variable "content" {
  type = string
  default = ""
}

variable "environments" {
  type = map(map(string))
  default = {
    test = { acc = "123" }
    prod = { acc = "456" }
  }
}
