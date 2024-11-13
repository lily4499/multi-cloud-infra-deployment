terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}


resource "digitalocean_droplet" "this" {
  name        = var.droplet_name
  region      = var.region
  size        = var.size
  image       = var.image
  ssh_keys    = var.ssh_keys
  tags        = var.tags
}


