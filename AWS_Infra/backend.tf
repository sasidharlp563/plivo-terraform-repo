terraform {
  backend "s3" {
    bucket  = "plivo-terraform-bucket" ###name of backend s3 manually created
    encrypt = true
    key     = "dev/terraform.tfstate"
    region  = "us-east-1"
  }
}