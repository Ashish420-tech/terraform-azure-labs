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
