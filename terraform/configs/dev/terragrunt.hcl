terraform {
  source = "../..//"
}

locals {
  project_id = "rtae-playground"
  location = "asia-southeast1"
  tf_address = "https://gitlab.com/api/v4/projects/1000/terraform/state/tf-state"
}

remote_state {
  backend = "http"

  config = {
    address = local.tf_address
    lock_address = "${local.tf_address}/lock"
    unlock_address = "${local.tf_address}/lock"
    username = get_env("GITLAB_USER")
    password = get_env("GITLAB_ACCESS_TOKEN")
    lock_method = "POST"
    unlock_method = "DELETE"
    retry_wait_min = 5
  }
}

inputs = {
  project_id = local.project_id
  location = local.location
  environment = "dev"
  services = [
    "autoscaling.googleapis.com",
    "artifactregistry.googleapis.com",
    "bigquery.googleapis.com",
    "bigquerymigration.googleapis.com",
    "bigquerystorage.googleapis.com",
    "cloudapis.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "cloudtrace.googleapis.com",
    "compute.googleapis.com",
    "container.googleapis.com",
    "containerfilesystem.googleapis.com",
    "containerregistry.googleapis.com",
    "domains.googleapis.com",
    "iam.googleapis.com",
    "iamcredentials.googleapis.com",
    "logging.googleapis.com",
    "monitoring.googleapis.com",
    "oslogin.googleapis.com",
    "servicemanagement.googleapis.com",
    "serviceusage.googleapis.com",
  ]

  node_pool_disk_capacity = 32
  node_pool_machine_type = "n1-standard-8"
  node_pool_node_count = 1
  node_pool_machine_spot_enable=true
  vpc_name = "gitlab-vpc"
  sn_name = "gitlab-psc-subnet"
}