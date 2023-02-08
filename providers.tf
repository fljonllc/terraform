terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

 Configure the AWS Provider
 provider "aws" {
  region     = "us-east-1" 
#new line added here
access_key = “AKIA3PEJPIK77ZTYGVWN”
secret_key = “XGWhHCJSmmXKWMC6MHQe2CVXie5XWMdUSUdFphqE”
}

# provider "aws" {
#  region                   = "us-east-1"
#  shared_credentials_files = ["~/.aws/credentials"]
#  profile                  = "vscode"
#}
