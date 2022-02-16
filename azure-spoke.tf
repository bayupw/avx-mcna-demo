# ---------------------------------------------------------------------------------------------------------------------
# Azure Spoke
# ---------------------------------------------------------------------------------------------------------------------
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