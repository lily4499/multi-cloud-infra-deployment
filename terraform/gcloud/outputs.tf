
#GCE
output "instance_ip" {
  description = "The external IP address of the GCE instance"
  value       = module.gce_instance.instance_ip
}


#ARTIFACT REGISTRY
output "artifact_registry_url" {
  description = "The URL of the Artifact Registry repository"
  value       = module.artifact_registry.repository_url
}



#GKE
output "gke_cluster_name" {
  description = "The name of the GKE cluster"
  value       = module.gke.cluster_name
}

output "gke_cluster_endpoint" {
  description = "The endpoint of the GKE cluster"
  value       = module.gke.endpoint
}
















