# DigitalOcean API token (omit if set as an environment variable)
#do_token = "your_digitalocean_api_token"


region         = "nyc3"


# Droplet configuration
droplet_name   = "my-droplet"
size           = "s-1vcpu-1gb"
image          = "ubuntu-20-04-x64"

# Optional - SSH keys and tags
ssh_keys = ["42135578"] # Replace with your actual SSH key ID(s)
tags     = ["web", "production"]





# Registry configuration
registry_name         = "dolilregistry"
subscription_tier_slug = "starter"  # Options include 'starter', 'basic', etc.







# Kubernetes cluster configuration
cluster_name        = "do-k8s-cluster"
node_pool_name      = "default-pool"
node_count          = 1
node_size           = "s-2vcpu-4gb"
kubernetes_version  = "1.22.8-do.0"
#tags                = ["k8s", "production"]
