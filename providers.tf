terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = "us-eat-1"
  profile = "Jenkins-Aws-Cred"
  
}
