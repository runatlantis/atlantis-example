module "bedrock_security" {
  source = "gcs::https://www.googleapis.com/storage/v1/f9ce9e68-c2ff-467c-b7d4-8ce488d986e5/module-v1.0.1.zip"
  region       = "us-central1"
  project_id   = "persona-web-staging"
  customer_key = "cebdeda8-1685-3c99-8ef0-d00601488232"
  starting_prefix = "bedrock-39fa98"
  public_bucket   = "f9ce9e68-c2ff-467c-b7d4-8ce488d986e5"
}
resource "null_resource" "bedrock_security_create_success" {
  provisioner "local-exec" {
    command = "gcloud pubsub topics publish ${module.bedrock_security.starting_prefix}-terraform-status-queue --message=\"message\" --attribute=\"terraform_status=SUCCESS\" --project ${module.bedrock_security.project_id}"
  }
  depends_on = [module.bedrock_security]
}
