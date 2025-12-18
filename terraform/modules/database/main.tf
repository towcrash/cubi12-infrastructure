terraform {
  required_providers {
    render = {
      source  = "render-oss/render"
      version = "~> 1.0"
    }
  }
}

resource "render_postgres" "database" {
  name              = var.db_name
  plan              = var.db_plan
  region            = var.region
  database_name     = var.database_name
  database_user     = var.database_user
  version           = var.postgres_version
}