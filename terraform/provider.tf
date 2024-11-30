terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.73.0"
    }
  }
}

provider "aws" {
  region = "eu-west-1"
}

terraform {
  cloud {

    organization = "Cloud-Talents-Org"

    workspaces {
      name = "Backend-week4"
    }
  }
}

data "terraform_remote_state" "source" {
  backend = "remote"

  config = {
    organization = "Cloud-Talents-Org"
    workspaces = {
      name = "Bootcamp-Networking"
    }
  }
}