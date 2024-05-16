terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

## Redundant empty provider block
# provider "docker" {}

resource "docker_image" "nginx_image" {
  name         = "nginx:1.25.5"
  keep_locally = true
}

resource "docker_container" "nginx" {
  image = docker_image.nginx_image.image_id
  name  = "nginx-server-${terraform.workspace}-${count.index}"

  hostname = terraform.workspace == "test" ? "local.test" : "local.prod"
  count = terraform.workspace == "test" ? 1 : 1
  # logs = terraform.workspace == "test"

  ports {
    internal = var.host_port
    external = var.container_port[terraform.workspace] + count.index // 😅😎
  }
}

output "docker_container_id" {
  value = docker_container.nginx[0].id
}
