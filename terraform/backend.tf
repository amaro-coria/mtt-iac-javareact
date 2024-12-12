terraform {
  backend "s3" {
    bucket         = "widgets-terraform-state-amarocoria"
    key            = "state/terraform.tfstate"
    region         = "us-west-2"
    dynamodb_table = "widgets-terraform-locks"
    encrypt        = true
  }
}