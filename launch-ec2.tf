terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  shared_config_files      = ["/home/nyilinhtut/.aws/config"]
  shared_credentials_files = ["/home/nyilinhtut/.aws/credentials"]
  profile                  = "main"
	alias                    = "main"
	region                   = "ap-southeast-1"
}

#Configure the AWS Resources
resource "aws_instance" "myec2-test" {
    ami = "ami-02453f5468b897e31"
    instance_type = "t2.micro"
}