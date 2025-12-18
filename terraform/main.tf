terraform {
  required_version = ">= 1.0"
  
  required_providers {
    render = {
      source  = "render-oss/render"
      version = "~> 1.0"
    }
  }
}

provider "render" {
  api_key = var.render_api_key
}

# 1. Base de Datos
module "database" {
  source = "./modules/database"
  
  db_name          = var.db_name
  db_plan          = var.db_plan
  region           = var.region
  database_name    = var.database_name
  database_user    = var.database_user
  postgres_version = var.postgres_version
}

# 2. Backend
module "backend" {
  source = "./modules/backend"
  
  service_name  = var.backend_service_name
  plan          = var.backend_plan
  region        = var.region
  docker_image  = var.backend_docker_image
  database_url  = module.database.internal_connection_string
  
  additional_env_vars = {
    JWT_SECRET = {
      value = var.jwt_secret
    }
    CORS_ORIGIN = {
      value = "https://${var.frontend_service_name}.onrender.com"
    }
  }
  
  health_check_path = var.backend_health_check_path
  
  depends_on = [module.database]
}

# 3. Frontend
module "frontend" {
  source = "./modules/frontend"
  
  service_name    = var.frontend_service_name
  plan            = var.frontend_plan
  region          = var.region
  docker_image    = var.frontend_docker_image
  backend_api_url = module.backend.api_url
  
  depends_on = [module.backend]
}