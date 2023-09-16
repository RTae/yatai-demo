output "sa_email" {
  value = google_service_account.sa.email
}

output "cluster_name" {
  value = google_container_cluster.gke_cluster.name
}