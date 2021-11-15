
terraform {
  backend "s3" {
    bucket = "terraform-projects-state-bucket"
    key = "chaining/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "terraform-state-lock"
    encrypt = true
  }
}

