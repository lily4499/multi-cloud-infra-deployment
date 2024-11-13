output "acr_login_server" {
  description = "The login server for the ACR instance"
  value       = azurerm_container_registry.acr.login_server
}

output "acr_id" {
  description = "The ID of the ACR instance"
  value       = azurerm_container_registry.acr.id
}
