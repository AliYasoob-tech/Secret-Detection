# Production Cloud Infrastructure Configuration
terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
provider "aws" {
  region = "us-east-1"
}
# LEAKED SECRETS: High-entropy credentials (no dummy/example keywords)
locals {
  aws_access_key = "AKIAJH7Y4T6Q8V9W0XYZ"
  github_pat     = "ghp_abcdefghijklmnopqrstuvwxyz0123456789"
  db_conn_string = "postgresql://postgres:9kNmPqRvTwXz2468@prod-db.internal:5432/mydb"
}
