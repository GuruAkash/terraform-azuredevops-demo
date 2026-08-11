subscription_id     = "4c7d8913-0664-4191-83e8-c48985cc74d2"
resource_group_name = "rg-tf-demo-dev"
location            = "Central India"

vnet_name       = "vnet-tf-demo-dev"
address_space   = ["10.0.0.0/16"]
subnet_name     = "snet-app-dev"
subnet_prefixes = ["10.0.1.0/24"]
nsg_name        = "nsg-tf-demo-dev"
storage_account_name = "imaribastorageaccdev001"
environment           = "dev"