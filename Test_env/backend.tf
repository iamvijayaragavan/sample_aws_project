terraform {
  backend "s3" {
    bucket         = "testsamplebucketpoc"
    key            = "terraform/state.tfstate"
    region         = "eu-west-1"
    encrypt        = true
  }
}
