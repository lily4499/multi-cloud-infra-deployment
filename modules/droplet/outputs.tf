output "droplet_ip" {
  value       = digitalocean_droplet.this.ipv4_address
  description = "The IP address of the created droplet"
}

output "droplet_id" {
  value       = digitalocean_droplet.this.id
  description = "The ID of the created droplet"
}
