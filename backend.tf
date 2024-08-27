terraform {
  backend "s3" {
    bucket         = module.s3.bucket_name
    key            = "terraform/state.tfstate"
    region         = var.aws_region
    encrypt        = true
  }
}