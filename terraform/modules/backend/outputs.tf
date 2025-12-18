output "service_id" {
  description = "Backend service ID"
  value       = render_web_service.backend.id
}

output "service_url" {
  description = "Backend service URL"
  value       = render_web_service.backend.url
}

output "api_url" {
  description = "Backend API URL"
  value       = "${render_web_service.backend.url}/api"
}