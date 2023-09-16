variable "project_id" {
  type        = string
  description = "The GCP project ID"
}

variable "location" {
  type        = string
  description = "The Region of the GKE cluster"
  default     = "asia-southeast1"
}

variable "environment" {
  type        = string
  description = "The environment of the service"
}

variable "services" {
  type        = list(string)
  description = "The services to deploy in gcp"
}

# GKE
variable "node_pool_disk_capacity" {
  type        = number
  description = "The disk capacity of the node pool"
  default     = 100
}

variable "node_pool_machine_type" {
  type        = string
  description = "The machine type of the node pool"
  default     = "n1-standard-1"
}

variable "node_pool_node_count" {
  type        = number
  description = "The number of nodes in the node pool"
  default     = 1
}

variable "node_pool_machine_spot_enable" {
  type        = bool
  description = "Enable spot instance for node pool"
  default     = false
}

variable "vpc_name" {
  type        = string
  description = "The name of the VPC"
}

variable "sn_name" {
  type        = string
  description = "The name of the subnet"
}