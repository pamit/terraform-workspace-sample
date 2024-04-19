resource "local_file" "foo" {
  content  = var.content
  filename = var.filename
  file_permission = "0777"
}
