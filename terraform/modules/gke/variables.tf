variable "project_id" {
  type        = string
  description = "The GCP project ID"
}

variable "location" {
  type        = string
  description = "The Region of the GKE cluster"
  default     = "asia-southeast1-a"

}

variable "name" {
  type        = string
  description = "The name of the GKE cluster"
}

variable "description" {
  type        = string
  description = "The description of the GKE cluster"
}

variable "display_name" {
  type        = string
  description = "The display name of the GKE cluster"
}

variable "node_pool_disk_capacity" {
  type        = number
  description = "The disk capacity of the GKE node pool in GB"
  default     = 16
}

variable "node_pool_machine_type" {
  type        = string
  description = "The machine type of the GKE node pool"
  default     = "n1-standard-1"

}

variable "node_pool_node_count" {
  type        = string
  description = "The number of nodes in the GKE cluster"
  default     = "1"

}

variable "node_pool_machine_spot_enable" {
  type        = bool
  description = "Enable spot instance for GKE node pool"
  default     = false
}

variable "vpc_name" {
  type        = string
  description = "The name of the VPC"
}

variable "sn_name" {
  type        = string
  description = "The name of the subnetwork in VPC"
}