## module.file1.local_file.foo
module "file1" {
    source = "./../../providers/file-module"
    filename = "file1.txt"
    content = "Hello Terraform!"
}

## module.file2.local_file.foo
# module "file2" {
#     source = "./../file-module"
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
