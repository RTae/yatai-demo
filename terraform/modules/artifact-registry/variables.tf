variable "project_id" {
  type        = string
  description = "The GCP project ID"
}

variable "location" {
  type        = string
  default     = "asia-southeast1"
  description = "The Region of the Artifact Registry repository"
}

variable "name" {
  type        = string
  description = "The name of the Artifact Registry repository"
}

variable "description" {
  type        = string
  description = "The description of the Artifact Registry repository"
}

variable "members" {
  type        = list(string)
  description = "The members to be granted the role"
}
