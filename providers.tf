terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
    aviatrix = {
      source  = "AviatrixSystems/aviatrix"
      version = "2.21.0-6.6.ga" #6.6
    }
  }
}