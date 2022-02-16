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

module "azure_prod_spoke_1" {
  source        = "terraform-aviatrix-modules/mc-spoke/aviatrix"
  cloud         = "azure"
  name          = "azure-prod-spoke"
  cidr          = cidrsubnet(local.azure_supernet, 8, 2)
  region        = var.azure_region
  account       = var.azure_account
  transit_gw    = module.azure_transit_1.transit_gateway.gw_name
  insane_mode   = var.hpe
  instance_size = var.azure_instance_size
  ha_gw         = var.ha_gw
}