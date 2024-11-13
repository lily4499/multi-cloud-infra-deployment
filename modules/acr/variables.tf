variable "resource_group" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The location for the ACR"
  type        = string
}

variable "acr_name" {
  description = "The unique name for the Azure Container Registry"
  type        = string
}

variable "sku" {
  description = "The SKU of the ACR (Basic, Standard, Premium)"
  type        = string
}

variable "admin_enabled" {
  description = "Whether the admin user is enabled"
  type        = bool
}
