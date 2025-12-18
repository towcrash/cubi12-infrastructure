terraform {
  required_providers {
    render = {
      source  = "render-oss/render"
      version = "~> 1.0"
    }
  }
}

resource "render_web_service" "frontend" {
  name   = var.service_name
  plan   = var.plan
  region = var.region
  
  runtime = "docker"
  
  image {
    owner_id   = "docker"
    image_path = var.docker_image
  }
  
  env_vars = {
    REACT_APP_API_URL = {
      value = var.backend_api_url
    }
  }
  
  health_check_path = "/"
  auto_deploy       = true
}