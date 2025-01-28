variable "existing_vnet_id" {
  description = "ID of existing VNet to peer with"
  type        = string
  default     = null
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "web-app-rg"
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "East US"
}

variable "sql_admin_login" {
  description = "SQL Server administrator login"
  type        = string
  sensitive   = true
}

variable "sql_admin_password" {
  description = "SQL Server administrator password"
  type        = string
  sensitive   = true
}

variable "aad_admin_object_id" {
  description = "Azure AD admin object ID"
  type        = string
}