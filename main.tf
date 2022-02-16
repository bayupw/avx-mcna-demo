# ---------------------------------------------------------------------------------------------------------------------
# AWS Transit
# ---------------------------------------------------------------------------------------------------------------------
module "aws_transit_1" {
  source              = "terraform-aviatrix-modules/mc-transit/aviatrix"
  cloud               = "aws"
  name                = "aws-transit"
  region              = var.aws_region
  cidr                = cidrsubnet(local.aws_supernet, 7, 0)
  account             = var.aws_account
  insane_mode         = var.hpe
  instance_size       = var.aws_instance_size
  ha_gw               = var.ha_gw
  enable_segmentation = var.enable_segmentation
  local_as_number     = 65501
}

# ---------------------------------------------------------------------------------------------------------------------
# Azure Transit
# ---------------------------------------------------------------------------------------------------------------------
module "azure_transit_1" {
  source              = "terraform-aviatrix-modules/mc-transit/aviatrix"
  cloud               = "azure"
  name                = "azure-transit"
  region              = var.azure_region
  cidr                = cidrsubnet(local.azure_supernet, 7, 0)
  account             = var.azure_account
  insane_mode         = var.hpe
  instance_size       = var.azure_instance_size
  ha_gw               = var.ha_gw
  enable_segmentation = var.enable_segmentation
  local_as_number     = 65502
}

# ---------------------------------------------------------------------------------------------------------------------
# GCP Transit
# ---------------------------------------------------------------------------------------------------------------------
module "gcp_transit_1" {
  source              = "terraform-aviatrix-modules/mc-transit/aviatrix"
  cloud               = "gcp"
  name                = "gcp-transit"
  region              = var.gcp_region
  cidr                = cidrsubnet(local.gcp_supernet, 7, 0)
  account             = var.gcp_account
  insane_mode         = var.hpe
  instance_size       = var.gcp_instance_size
  ha_gw               = var.ha_gw
  enable_segmentation = var.enable_segmentation
  local_as_number     = 65503
}