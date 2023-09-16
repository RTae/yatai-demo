# ------------------------------------------------------------------------------
# SERVICE
# ------------------------------------------------------------------------------
resource "google_project_service" "services" {
  for_each = toset(var.services)

  project = var.project_id
  service = each.value
}

# ------------------------------------------------------------------------------
# Registry
# ------------------------------------------------------------------------------
module "registry" {
  count = var.environment == "dev" ? 1 : 0
  source = "./modules/artifact-registry"

  project_id  = var.project_id
  location    = var.location
  name        = "mlop-cluster"
  description = "Artifact Registry for mlop-cluster"

  members = [
    "serviceAccount:${module.cluster.sa_email}",
  ]

  depends_on = [
    module.cluster
  ]
}

# ------------------------------------------------------------------------------
# GKE
# ------------------------------------------------------------------------------
module "cluster" {
  source = "./modules/gke"

  project_id   = var.project_id
  location     = var.location
  name         = "mlop-cluster-${var.environment}"
  description  = "Cluster for machine learning operations (MLOp) ${title(var.environment)}"
  display_name = "mlop-cluster service ${title(var.environment)}"

  node_pool_disk_capacity       = var.node_pool_disk_capacity
  node_pool_machine_type        = var.node_pool_machine_type
  node_pool_node_count          = var.node_pool_node_count
  vpc_name                      = var.vpc_name
  sn_name                       = var.sn_name
  node_pool_machine_spot_enable = var.node_pool_machine_spot_enable
}