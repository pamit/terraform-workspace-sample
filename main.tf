terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

resource "docker_image" "nginx_img" {
  name         = "nginx:latest"
  keep_locally = true
}

resource "docker_container" "nginx" {
  image = docker_image.nginx_img.image_id
  name  = "nginx-server-${terraform.workspace}-${count.index}"

  hostname = terraform.workspace == "dev" ? "local.dev" : "local.prod"
  count = terraform.workspace == "dev" ? 1 : 2
  logs = terraform.workspace == "dev"

  ports {
    internal = var.host_port
    external = var.container_port + count.index // 😅😎
  }
}
