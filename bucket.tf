resource "google_storage_bucket" "bucket_pruebas" {
  name          = var.bucket_name
  project       = var.project_id
  location      = "us-central1"          # Región gratuita
  storage_class = "STANDARD"     # Forzamos Standard Storage
  force_destroy = true
  uniform_bucket_level_access = true

  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      age            = 1 # dias
      matches_prefix = ["ventas"]  # Solo objetos que empiecen con 'ventas'
    }
  }

  labels = {
    environment = "test"
    owner       = "joseferroni"
  }
}