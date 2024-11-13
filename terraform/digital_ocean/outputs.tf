# Outputs for resources created by the modules

output "droplet_ips" {
  description = "Public IP addresses of the Droplets"
  value       = module.droplets.droplet_ips
}

output "droplet_ids" {
  description = "IDs of the Droplets"
  value       = module.droplets.droplet_ids
}





output "registry_name" {
  description = "Name of the DigitalOcean Container Registry"
  value       = module.registry.registry_name
}

output "registry_endpoint" {
  description = "URL endpoint of the DigitalOcean Container Registry"
  value       = module.registry.registry_endpoint
}



output "kubernetes_cluster_name" {
  description = "Name of the Kubernetes cluster"
  value       = module.kubernetes_cluster.cluster_name
}

output "kubeconfig" {
  description = "Kubeconfig content to access the Kubernetes cluster"
  value       = module.kubernetes_cluster.kubeconfig
  sensitive   = true
}




