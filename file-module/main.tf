terraform {
  required_providers {
    local = {
      source = "hashicorp/local"
      version = "2.4.1"
    }
  }
}

resource "local_file" "foo" {
  # for_each = var.environments
  # filename = "../artifacts/${each.key}-${each.value["acc"]}-${var.filename}"
  filename = "../artifacts/${terraform.workspace}-${var.filename}"
  content  = var.content
  file_permission = "0777"
}
