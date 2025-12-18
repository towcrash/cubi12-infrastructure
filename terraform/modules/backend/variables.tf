variable "service_name" {
  description = "Name of the backend service"
  type        = string
}

variable "plan" {
  description = "Render plan (free, starter, standard, pro)"
  type        = string
  default     = "free"
}

variable "region" {
  description = "Render region"
  type        = string
}

variable "docker_image" {
  description = "Docker image for backend"
  type        = string
}

variable "database_url" {
  description = "Database connection URL"
  type        = string
  sensitive   = true
}

variable "additional_env_vars" {
  description = "Additional environment variables"
  type = map(object({
    value = string
  }))
  default = {}
}

variable "health_check_path" {
  description = "Health check endpoint"
  type        = string
  default     = "/api/health"
}