variable "project_id" {
  description = "ID del proyecto de GCP"
  type        = string
}

variable "bucket_name" {
  description = "Nombre del bucket de GCP"
  type        = string
}

variable "billing_account_id" {
  description = "ID de la cuenta de facturación de GCP"
  type        = string
}

variable "budget_amount_usd" {
  description = "Monto máximo del presupuesto en USD"
  type        = number
  default     = 5
}

variable "owner_emails" {
  description = "Lista de usuarios que tendrán rol Owner en el proyecto"
  type        = list(string)
}

variable "billing_emails" {
  description = "Lista de usuarios que tendrán rol Billing Admin en la cuenta de facturación"
  type        = list(string)
}
variable "bq_dataset_name_staging" {
  description = "Nombre del dataset de BigQuery staging"
  type        = string
}
variable "bq_dataset_name_produccion" {
  description = "Nombre del dataset de BigQuery produccion"
  type        = string
}