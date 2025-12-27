resource "google_project_iam_member" "owner_access" {
  for_each = toset(var.owner_emails)
  project  = var.project_id
  role     = "roles/owner"
  member   = "user:${each.value}"
  }
#---------------------------------------------------
# resource "google_project_iam_member" "owner_access" {
#  project = var.project_id
#  role    = "roles/owner"
#  member  = "user:${var.owner_email}"
#} si fuera para un usuario
#-----------------------------------------------------
resource "google_billing_account_iam_member" "billing_admin" {
  for_each           = toset(var.billing_emails)
  billing_account_id  = var.billing_account_id
  role                = "roles/billing.admin"
  member              = "user:${each.value}"
}