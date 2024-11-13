resource "digitalocean_container_registry" "this" {
  name              = var.registry_name
  subscription_tier_slug = var.subscription_tier_slug
  region            = var.region
}

# Outputs
output "registry_name" {
  value = digitalocean_container_registry.this.name
}

output "registry_endpoint" {
  value = digitalocean_container_registry.this.endpoint
}
