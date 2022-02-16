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

module "aws_prod_spoke_1" {
  source        = "terraform-aviatrix-modules/mc-spoke/aviatrix"
  cloud         = "AWS"
  name          = "aws-prod-spoke"
  cidr          = cidrsubnet(local.aws_supernet, 8, 2)
  region        = var.aws_region
  account       = var.aws_account
  transit_gw    = module.aws_transit_1.transit_gateway.gw_name
  insane_mode   = var.hpe
  instance_size = var.aws_instance_size
  ha_gw         = var.ha_gw
}
