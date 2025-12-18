# Render API Key
variable "render_api_key" {
  description = "Render API Key"
  type        = string
  sensitive   = true
}

# Region
variable "region" {
  description = "Render region (oregon, frankfurt, singapore, ohio)"
  type        = string
  default     = "oregon"
}

# Database Variables
variable "db_name" {
  description = "Database service name"
  type        = string
  default     = "cubi12-database"
}

variable "db_plan" {
  description = "Database plan"
  type        = string
  default     = "free"
}

variable "database_name" {
  description = "Database name"
  type        = string
  default     = "cubi12"
}

variable "database_user" {
  description = "Database user"
  type        = string
  default     = "cubi12user"
}

variable "postgres_version" {
  description = "PostgreSQL version"
  type        = string
  default     = "16"
}

# Backend Variables
variable "backend_service_name" {
  description = "Backend service name"
  type        = string
  default     = "cubi12-backend"
}

variable "backend_plan" {
  description = "Backend plan"
  type        = string
  default     = "free"
}

variable "backend_docker_image" {
  description = "Backend Docker image"
  type        = string
}

variable "backend_health_check_path" {
  description = "Backend health check path"
  type        = string
  default     = "/api/health"
}

variable "jwt_secret" {
  description = "JWT Secret for authentication"
  type        = string
  sensitive   = true
}

# Frontend Variables
variable "frontend_service_name" {
  description = "Frontend service name"
  type        = string
  default     = "cubi12-frontend"
}

variable "frontend_plan" {
  description = "Frontend plan"
  type        = string
  default     = "free"
}

variable "frontend_docker_image" {
  description = "Frontend Docker image"
  type        = string
}