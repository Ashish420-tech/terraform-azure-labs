variable "resource_group_name" {
  type = string
}

variable "location" {
  type    = string
  default = "East US"
}

variable "vnet_name" {
  type = string
}

variable "vnet_address_space" {
  type = list(string)
}

variable "subnet_name" {
  type = string
}

variable "subnet_address_prefixes" {
  type = list(string)
}

variable "public_ip_name" {
  type = string
}

variable "nic_name" {
  type = string
}

variable "vm_name" {
  type = string
}

variable "admin_username" {
  type = string
}
