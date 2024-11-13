variable "registry_name" {
  description = "Name of the DigitalOcean Container Registry"
  type        = string
}

variable "subscription_tier_slug" {
  description = "Subscription tier for the registry (e.g., 'starter', 'basic')"
  type        = string
}

variable "region" {
  description = "Region for storing registry images"
  type        = string
}
