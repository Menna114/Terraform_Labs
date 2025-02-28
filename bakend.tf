terraform {
  backend "s3" {
    bucket = "terraform-bucket-menna"
    key    = "terraform.tfstate"
    region = "us-east-1"
    profile = "terraform"
  }
}
