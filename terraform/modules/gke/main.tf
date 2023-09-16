resource "google_service_account" "sa" {
  project      = var.project_id
  account_id   = "${var.name}-sa"
  display_name = "${var.display_name} account"
  description  = var.description
}

data "google_compute_network" "gke_network_vpc" {
  name   = var.vpc_name
}

data "google_compute_subnetwork" "gke_network_sn" {
  name   = var.sn_name
  region = var.location
}

resource "google_container_cluster" "gke_cluster" {
  name     = "${var.name}-gke-cluster"
  location = "${var.location}-b"

  remove_default_node_pool = true
  network    = data.google_compute_network.gke_network_vpc.id
  subnetwork = data.google_compute_subnetwork.gke_network_sn.id

  node_pool {
    name = "default-pool"
  }

  lifecycle {
    ignore_changes = [node_pool]
  }

}

resource "google_container_node_pool" "gke_pool" {
  name     = "${var.name}-gke-pool"
  location = "${var.location}-b"
  cluster  = google_container_cluster.gke_cluster.name

  node_count = var.node_pool_node_count

  management {
    auto_repair  = true
    auto_upgrade = true
  }

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]

    spot = var.node_pool_machine_spot_enable
    service_account = google_service_account.sa.email
    disk_size_gb    = var.node_pool_disk_capacity
    machine_type    = var.node_pool_machine_type
  }

}
