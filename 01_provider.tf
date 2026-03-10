terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}

data "aws_caller_identity" "current" {}

data "aws_availability_zones" "available" {
  state = "available"
}

locals {
  project = var.project_name
  azs     = slice(data.aws_availability_zones.available.names, 0, 2)

  common_tags = {
    Project = var.project_name
    Env     = var.environment
    Managed = "terraform"
  }
}