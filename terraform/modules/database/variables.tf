variable "db_name" {
  description = "Name of the PostgreSQL database"
  type        = string
}

variable "db_plan" {
  description = "Render database plan (free, starter, standard, pro)"
  type        = string
  default     = "free"
}

variable "region" {
  description = "Render region"
  type        = string
}

variable "database_name" {
  description = "Database name"
  type        = string
}

variable "database_user" {
  description = "Database user"
  type        = string
}

variable "postgres_version" {
  description = "PostgreSQL version"
  type        = string
  default     = "16"
}