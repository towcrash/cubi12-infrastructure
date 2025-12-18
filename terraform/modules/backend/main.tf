terraform {
  required_providers {
    render = {
      source  = "render-oss/render"
      version = "~> 1.0"
    }
  }
}

resource "render_web_service" "backend" {
  name   = var.service_name
  plan   = var.plan
  region = var.region
  
  runtime = "docker"
  
  image {
    owner_id   = "docker"
    image_path = var.docker_image
  }
  
  env_vars = merge(
    {
      NODE_ENV = {
        value = "production"
      }
      DATABASE_URL = {
        value = var.database_url
      }
      PORT = {
        value = "80"
      }
    },
    var.additional_env_vars
  )
  
  health_check_path = var.health_check_path
  auto_deploy       = true
}