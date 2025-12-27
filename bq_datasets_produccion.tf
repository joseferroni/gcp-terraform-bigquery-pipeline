resource "google_bigquery_dataset" "produccion_datasets" {
  dataset_id = var.bq_dataset_name_produccion
  project    = var.project_id
  location   = "us-central1"  # Región gratuita del Free Tier
  description = "Dataset de prueba produccion dentro del Free Tier"

  labels = {
    environment = "test"
    owner       = "joseferroni"
  }
  depends_on = [
    google_project_service.bigquery
  ]
}

# 3. Definición de la Tabla Nativa (Internal Storage)
resource "google_bigquery_table" "sandbox_tabla_nativa_ventas" {
  dataset_id = google_bigquery_dataset.produccion_datasets.dataset_id
  project    = var.project_id
  table_id   = "ventas_nativa"

  deletion_protection = false 

  # Definimos el mismo esquema que tu tabla externa
  schema = <<EOF
[
  {"name": "OrderID", "type": "STRING", "mode": "NULLABLE"},
  {"name": "Product", "type": "STRING", "mode": "NULLABLE"},
  {"name": "Category", "type": "STRING", "mode": "NULLABLE"},
  {"name": "Brand", "type": "STRING", "mode": "NULLABLE"},
  {"name": "Platform", "type": "STRING", "mode": "NULLABLE"},
  {"name": "City", "type": "STRING", "mode": "NULLABLE"},
  {"name": "Price", "type": "FLOAT", "mode": "NULLABLE"},
  {"name": "Quantity", "type": "INTEGER", "mode": "NULLABLE"},
  {"name": "TotalAmount", "type": "FLOAT", "mode": "NULLABLE"},
  {"name": "Rating", "type": "FLOAT", "mode": "NULLABLE"},
  {"name": "Reviews", "type": "INTEGER", "mode": "NULLABLE"},
  {"name": "OrderDate", "type": "TIMESTAMP", "mode": "NULLABLE"}
]
EOF

  # Opcional: Configuración de particionamiento para optimizar consultas
  time_partitioning {
    type  = "DAY"
    field = "OrderDate" 
  }
}