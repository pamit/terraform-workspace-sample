# module "file1" {
#     source = "./../modules"
#     filename = "artifacts/file1"
# }

# module "file2" {
#     source = "./../modules"
#     filename = "artifacts/file2"
# }

# ##### All files:
# module "file-module" {
#   source = "./file-module"
# }

# ##### Existing files moved:
# moved {
#   from = module.file1.local_file.foo
#   to   = module.file-module.module.file1.local_file.foo
# }
# moved {
#   from = module.file2.local_file.foo
#   to   = module.file-module.module.file2.local_file.foo
# }
