variable "mssql_server_name" {
  description = "The name of the SQL server."
  type        = string  
  
}

variable "resource_group_name" {
  description = "The name of the resource group where the SQL server will be created."
  type        = string
  
}

variable "resource_group_location" {
  description = "The location of the resource group."
  type        = string
  
}

variable "administrator_login" {
  description = "The administrator login for the SQL server."
  type        = string
}

variable "administrator_login_password" {
  description = "The password for the SQL server administrator."
  type        = string
  sensitive   = true
}