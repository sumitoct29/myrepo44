variable "nic_name" {
  description = "The name of the network interface."
  type        = string  
  
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string  
  
}

variable "resource_group_location" {
  description = "The location of the resource group."
  type        = string    

}

variable "vm_name" {
  description = "The name of the virtual machine."
  type        = string  
}



variable "image_publisher" {
  description = "The publisher of the image to use for the virtual machine."
  type        = string  
}

variable "image_offer" {
  description = "The offer of the image to use for the virtual machine."
  type        = string  
}

variable "image_sku" {
  description = "The SKU of the image to use for the virtual machine."
  type        = string  
}


variable "subnet" {
  description = "The name of the frontend subnet."
  type        = string  
}

variable "vnetname" {
  description = "The name of the virtual network."
  type        = string  
}

variable "pip_name" {
  description = "The name of the public IP address."
  type        = string    
  
}



