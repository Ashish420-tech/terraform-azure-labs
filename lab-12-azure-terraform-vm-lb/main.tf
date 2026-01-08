terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
  use_cli = true
}

# -------------------------
# Resource Group
# -------------------------
resource "azurerm_resource_group" "rg" {
  name     = "lab12-rg"
  location = var.location
}

# -------------------------
# Network
# -------------------------
resource "azurerm_virtual_network" "vnet" {
  name                = "lab12-vnet"
  address_space       = ["10.60.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "subnet" {
  name                 = "frontend-subnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.60.1.0/24"]

  depends_on = [
    azurerm_virtual_network.vnet
  ]
}

# -------------------------
# Public IP
# -------------------------
resource "azurerm_public_ip" "lb_pip" {
  name                = "lab12-lb-pip"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

# -------------------------
# Load Balancer
# -------------------------
resource "azurerm_lb" "lb" {
  name                = "lab12-lb"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = "Standard"

  frontend_ip_configuration {
    name                 = "PublicFrontend"
    public_ip_address_id = azurerm_public_ip.lb_pip.id
  }

  depends_on = [
    azurerm_public_ip.lb_pip
  ]
}

resource "azurerm_lb_backend_address_pool" "backend_pool" {
  name            = "backend-pool"
  loadbalancer_id = azurerm_lb.lb.id

  depends_on = [
    azurerm_lb.lb
  ]
}

resource "azurerm_lb_probe" "http_probe" {
  name            = "http-probe"
  loadbalancer_id = azurerm_lb.lb.id
  protocol        = "Http"
  port            = 80
  request_path    = "/"

  depends_on = [
    azurerm_lb.lb
  ]
}

resource "azurerm_lb_rule" "http_rule" {
  name                           = "http-rule"
  loadbalancer_id                = azurerm_lb.lb.id
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "PublicFrontend"
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.backend_pool.id]
  probe_id                       = azurerm_lb_probe.http_probe.id

  depends_on = [
    azurerm_lb_backend_address_pool.backend_pool,
    azurerm_lb_probe.http_probe
  ]
}

# -------------------------
# Network Interfaces
# -------------------------
resource "azurerm_network_interface" "nic" {
  count               = 2
  name                = "lab12-nic-${count.index}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
  }

  depends_on = [
    azurerm_subnet.subnet
  ]
}

# -------------------------
# NIC → Backend Pool Association
# -------------------------
resource "azurerm_network_interface_backend_address_pool_association" "nic_lb_assoc" {
  count                   = 2
  network_interface_id    = azurerm_network_interface.nic[count.index].id
  ip_configuration_name   = "internal"
  backend_address_pool_id = azurerm_lb_backend_address_pool.backend_pool.id

  depends_on = [
    azurerm_network_interface.nic,
    azurerm_lb_backend_address_pool.backend_pool
  ]
}

# -------------------------
# Virtual Machines
# -------------------------
resource "azurerm_linux_virtual_machine" "vm" {
  count               = 2
  name                = "lab12-vm-${count.index}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  size                = var.vm_size
  admin_username      = "azureuser"

  network_interface_ids = [
    azurerm_network_interface.nic[count.index].id
  ]

  admin_password = "P@ssword1234!"
  disable_password_authentication = false

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  custom_data = base64encode(<<EOF
#!/bin/bash
apt update
apt install -y nginx
echo "Hello from VM-${count.index}" > /var/www/html/index.html
systemctl restart nginx
EOF
  )

  depends_on = [
    azurerm_network_interface_backend_address_pool_association.nic_lb_assoc
  ]
}
