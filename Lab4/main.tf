terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

resource "docker_image" "nginx" {
  name         = "nginx"
  keep_locally = false
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = "tutorial"

  ports {
    internal = 80
    external = 8125
  }
}

# Define a new Docker container resource that depends on the existing nginx container
resource "docker_container" "dependent_container" {
  image = "alpine"
  name  = "dependent-container"

  # Specify a dependency on the existing nginx container by referencing its ID
  depends_on = [docker_container.nginx]
}
