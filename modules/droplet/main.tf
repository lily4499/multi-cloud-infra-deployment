terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}


resource "digitalocean_droplet" "this" {
  count       = var.droplet_count
  name        = "${var.droplet_name}-${count.index + 1}"
  region      = var.region
  size        = var.size
  image       = var.image
  ssh_keys    = var.ssh_keys
  tags        = var.tags
}

