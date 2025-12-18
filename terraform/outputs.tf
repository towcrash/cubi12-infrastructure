# Database Outputs
output "database_connection_string" {
  description = "Database connection string (use internal for backend)"
  value       = module.database.internal_connection_string
  sensitive   = true
}

output "database_external_url" {
  description = "Database external connection string"
  value       = module.database.external_connection_string
  sensitive   = true
}

output "database_host" {
  description = "Database host"
  value       = module.database.host
}

# Backend Outputs
output "backend_url" {
  description = "Backend service URL"
  value       = module.backend.service_url
}

output "backend_api_url" {
  description = "Backend API URL"
  value       = module.backend.api_url
}

# Frontend Outputs
output "frontend_url" {
  description = "Frontend service URL"
  value       = module.frontend.service_url
}

# Summary
output "application_urls" {
  description = "All application URLs"
  value = {
    frontend = module.frontend.service_url
    backend  = module.backend.service_url
    api      = module.backend.api_url
    database = module.database.host
  }
}