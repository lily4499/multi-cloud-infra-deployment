output "registry_name" {
  description = "Name of the DigitalOcean Container Registry"
  value       = digitalocean_container_registry.this.name
}

output "registry_endpoint" {
  description = "URL endpoint of the DigitalOcean Container Registry"
  value       = digitalocean_container_registry.this.endpoint
}
