terraform {
  backend "s3" {
    endpoint                    = "https://s3.fr-par.scw.cloud"
    bucket                      = "trungle-test-terraform-state"
    key                         = "state/terraform.tfstate"
    region                      = "us-east-1"
    skip_credentials_validation = true
    skip_metadata_api_check     = true
  }
}