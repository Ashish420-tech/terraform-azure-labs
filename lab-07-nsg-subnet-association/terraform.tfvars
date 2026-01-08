resource_group_name     = "rg-terraform-lab7"
location                = "East US"

vnet_name               = "vnet-lab7"
vnet_address_space      = ["10.1.0.0/16"]

subnet_name             = "subnet-lab7"
subnet_address_prefixes = ["10.1.1.0/24"]

nsg_name                = "nsg-lab7"
