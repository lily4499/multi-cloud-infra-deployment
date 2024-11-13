output "kubeconfig" {
  description = "Kubeconfig content to access the Kubernetes cluster"
  value       = digitalocean_kubernetes_cluster.this.kube_configs[0].raw_config
}

output "cluster_name" {
  description = "Name of the Kubernetes cluster"
  value       = digitalocean_kubernetes_cluster.this.name
}
