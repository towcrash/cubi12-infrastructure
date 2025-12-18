output "database_id" {
  description = "Database ID"
  value       = render_postgres.database.id
}

output "internal_connection_string" {
  description = "Internal connection string for services in Render"
  value       = render_postgres.database.internal_connection_string
  sensitive   = true
}

output "external_connection_string" {
  description = "External connection string"
  value       = render_postgres.database.external_connection_string
  sensitive   = true
}

output "host" {
  description = "Database host"
  value       = render_postgres.database.host
}

output "port" {
  description = "Database port"
  value       = render_postgres.database.port
}