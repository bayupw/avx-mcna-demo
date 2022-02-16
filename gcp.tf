module "gcp_transit_1" {
  source = "terraform-aviatrix-modules/mc-transit/aviatrix"
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

module "gcp_prod_spoke_1" {
  source = "terraform-aviatrix-modules/mc-spoke/aviatrix"
  cloud         = "gcp"
  name          = "gcp-prod-spoke"
  cidr          = cidrsubnet(local.gcp_supernet, 8, 2)
  region        = var.gcp_region
  account       = var.gcp_account
  transit_gw    = module.gcp_transit_1.transit_gateway.gw_name
  insane_mode   = var.hpe
  instance_size = var.gcp_instance_size
  ha_gw         = var.ha_gw
}