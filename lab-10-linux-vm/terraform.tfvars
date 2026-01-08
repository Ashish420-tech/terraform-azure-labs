resource_group_name     = "rg-terraform-lab10"
location                = "Central US"

vnet_name               = "vnet-lab10"
vnet_address_space      = ["10.3.0.0/16"]

subnet_name             = "subnet-lab10"
subnet_address_prefixes = ["10.3.1.0/24"]

public_ip_name          = "pip-lab10"
nic_name                = "nic-lab10"

vm_name                 = "vm-lab10"
admin_username          = "azureuser"
