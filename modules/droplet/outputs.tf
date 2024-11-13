output "droplet_ips" {
  description = "Public IP addresses of the Droplets"
  value       = [for droplet in digitalocean_droplet.this : droplet.ipv4_address]
}

output "droplet_ids" {
  description = "IDs of the Droplets"
  value       = [for droplet in digitalocean_droplet.this : droplet.id]
}
