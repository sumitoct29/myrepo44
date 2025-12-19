variable "subnet_name" {
  description = "The name of the subnet."
  type        = string
  
}

variable "subnet_address_prefixes" {
  description = "The address prefixes for the subnet."
  type        = list(string)
}

variable "vnet_name" {
  description = "The name of the virtual network."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group where the subnet is located."
  type        = string
}

