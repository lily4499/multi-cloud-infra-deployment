# Specify the DigitalOcean provider
provider "digitalocean" {
  token = env.DIGITALOCEAN_TOKEN
}


terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"  # Adjust the version as needed
    }
  }
}