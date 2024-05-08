terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
    local = {
      source = "hashicorp/local"
      version = "2.4.1"
    }
  }
}

provider "docker" {
  alias = "duck"
  host = "unix:///var/run/docker.sock"
}

provider "docker" {
  alias = "cat"
  host = "ssh://user@remote-host:22"
}

resource "docker_image" "nginx_img" {
  name         = "nginx:latest"
  keep_locally = true
}

resource "docker_container" "nginx" {
  image = docker_image.nginx_img.image_id
  name  = "nginx-server-${terraform.workspace}-${count.index}"
  provider = docker.duck

  hostname = terraform.workspace == "test" ? "local.test" : "local.prod"
  count = terraform.workspace == "test" ? 1 : 2
  logs = terraform.workspace == "test"

  ports {
    internal = var.host_port
    external = var.container_port + count.index // 😅😎
  }
}

output "accounts" {
  # value = values(var.account_ids)
  value = var.account_ids["test"]
}
