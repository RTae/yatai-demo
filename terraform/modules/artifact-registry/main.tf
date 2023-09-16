resource "google_artifact_registry_repository" "artifact-registry" {
  location      = var.location
  project       = var.project_id
  repository_id = "${var.name}-gar"
  description   = var.description
  format        = "DOCKER"
}

resource "google_artifact_registry_repository_iam_binding" "binding" {
  project    = var.project_id
  location   = var.location
  repository = google_artifact_registry_repository.artifact-registry.name
  role       = "roles/artifactregistry.repoAdmin"
  members    = var.members
}
