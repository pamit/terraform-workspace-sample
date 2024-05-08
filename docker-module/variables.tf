variable "host_port" {
  description = "Host port"
  type        = number
  default     = 80
}

variable "container_port" {
  description = "Container port"
  type        = number
  default = 8080
}

variable "github_org" {
  type = string
  default = "pamit"
}

variable "account_ids" {
  type    = map(string)
  default = {
    test       = "123"
    production = "456"
  }
}

variable "filename" {
  type = string
  default = ""
}

variable "filenames" {
  type = map(string)
  default = {
    file1 = "file1"
    file2 = "file2"
  }
}