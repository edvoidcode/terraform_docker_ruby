terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

resource "docker_image" "ruby_app" {
  name         = "ruby_app"
  build {
    context    = "${path.module}/app"
  }
}

resource "docker_container" "ruby_app" {
  name  = "ruby_app"
  image = docker_image.ruby_app.name

  ports {
    internal = 4567
    external = 4567
  }
}