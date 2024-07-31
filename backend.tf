terraform {
  backend "s3" {
    bucket = "cloudporn-tf-state"
    key    = "faraway"
    region = "us-east-1"
  }
}