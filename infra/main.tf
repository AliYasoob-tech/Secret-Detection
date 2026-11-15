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
  region = var.aws_region
}

variable "aws_region" {
  type    = string
  default = "us-east-1"
}

# Database definition with safe secret management
resource "aws_db_instance" "app_db" {
  allocated_storage    = 20
  engine               = "postgres"
  engine_version       = "15.3"
  instance_class       = "db.t3.micro"
  db_name              = "production_db"
  username             = var.db_username
  password             = var.db_password_secret  # Safe variable reference
  parameter_group_name = "default.postgres15"
  skip_final_snapshot  = true
}

resource "aws_s3_bucket" "static_assets" {
  bucket        = "company-production-assets-2026"
  force_destroy = false
}
# Test: Leaked secret injection to verify blocker
locals {
  aws_admin_key = "AKIAIOSFODNN7EXAMPLEKEY"
  db_hardcoded_pass = "P@ssw0rd2026!AdminAccess"
}
