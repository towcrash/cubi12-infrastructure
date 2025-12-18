output "service_id" {
  description = "Frontend service ID"
  value       = render_web_service.frontend.id
}

output "service_url" {
  description = "Frontend service URL"
  value       = render_web_service.frontend.url
}