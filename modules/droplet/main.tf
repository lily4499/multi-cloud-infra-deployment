resource "digitalocean_droplet" "this" {
  count       = var.count
  name        = "${var.droplet_name}-${count.index + 1}"
  region      = var.region
  size        = var.size
  image       = var.image
  ssh_keys    = var.ssh_keys
  tags        = var.tags
}

# Provide outputs for each created droplet
output "droplet_ips" {
  value = [for droplet in digitalocean_droplet.this : droplet.ipv4_address]
}

output "droplet_ids" {
  value = [for droplet in digitalocean_droplet.this : droplet.id]
}
