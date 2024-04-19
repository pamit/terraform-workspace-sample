terraform {
  required_providers {
    local = {
      source = "hashicorp/local"
      version = "2.4.1"
    }
  }
}

module "file1" {
    source = "./../modules"
    filename = "artifacts/file1"
    content = "Hello Terraform!"
}

# module "file2" {
#     source = "./../modules"
#     filename = "artifacts/file2"
# }

# moved {
#   from = module.file1.local_file.foo
#   to   = module.file-module.module.file1.local_file.foo
# }

# moved {
#   from = module.file2.local_file.foo
#   to   = module.file-module.module.file2.local_file.foo
# }
