variable "service_name" {
  description = "Name of the frontend service"
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
  description = "Docker image for frontend"
  type        = string
}

variable "backend_api_url" {
  description = "Backend API URL"
  type        = string
}