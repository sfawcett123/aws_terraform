terraform {
  backend "s3" {
    bucket = "terraform-sf-bkt"
    key    = "states/eks-1"
    region = "eu-west-1"
  }
}
