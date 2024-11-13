# Outputs for resources created by the modules

output "droplet_ip" {
  description = "Public IP address of the Droplet"
  value       = module.droplets.droplet_ip  # Change to reference the singular output
}

output "droplet_id" {
  description = "ID of the Droplet"
  value       = module.droplets.droplet_id  # Change to reference the singular output
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




