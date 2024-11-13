terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}



provider "digitalocean" {
  token = env.DIGITALOCEAN_TOKEN  # Make sure this environment variable is set
}