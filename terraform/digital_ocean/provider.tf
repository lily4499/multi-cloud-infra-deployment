terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"  # Correct source for DigitalOcean provider
      version = "~> 2.0"  # Adjust the version as needed
    }
  }
}

provider "digitalocean" {
  token = env.DIGITALOCEAN_TOKEN  # Make sure this environment variable is set
}