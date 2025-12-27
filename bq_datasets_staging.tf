resource "google_bigquery_dataset" "sandbox_staging" {
  dataset_id = var.bq_dataset_name_staging
  project    = var.project_id
  location   = "us-central1"  # Región gratuita del Free Tier
  description = "Dataset de prueba dentro del Free Tier"

  
  labels = {
    environment = "test"
    owner       = "xxxxxxx"
  }
  depends_on = [
    google_project_service.bigquery
  ]
}

# 2. Definición de la Tabla Externa
resource "google_bigquery_table" "sandbox_tabla_externa_ventas" {
  dataset_id = google_bigquery_dataset.sandbox_staging.dataset_id # aca se le inventa el nombre si o si el nombre del dataset seteado 
  project    = var.project_id
  table_id   = "ventas_externa"
  
  # Permite que Terraform borre la tabla si haces un destroy
  deletion_protection = false 

  external_data_configuration {
    autodetect    = false
    source_format = "PARQUET"
    
    # IMPORTANTE: Reemplaza 'NOMBRE_DE_TU_BUCKET' por el tuyo
    source_uris = [
      "gs://testeo_bkt_arg/ventas_*.parquet"
    ]

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
  }

}
