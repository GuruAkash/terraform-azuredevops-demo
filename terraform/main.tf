module "resource_group" {
  source = "./modules/resourcegroup"

  resource_group_name = var.resource_group_name
  location            = var.location
}

module "network" {
  source = "./modules/network"

  resource_group_name = module.resource_group.resource_group_name
  location            = var.location

  vnet_name       = var.vnet_name
  address_space   = var.address_space
  subnet_name     = var.subnet_name
  subnet_prefixes = var.subnet_prefixes
}

module "nsg" {
  source = "./modules/nsg"

  resource_group_name = module.resource_group.resource_group_name
  location            = var.location
  nsg_name            = var.nsg_name
  subnet_id           = module.network.subnet_id
}

module "storage" {
  source = "./modules/storage"

  resource_group_name  = module.resource_group.resource_group_name
  location             = var.location
  storage_account_name = var.storage_account_name
  environment          = var.environment
}