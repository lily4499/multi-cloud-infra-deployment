output "kubeconfig" {
  description = "Kubeconfig content to access the Kubernetes cluster"
  value       = digitalocean_kubernetes_cluster.do_cluster.kube_config[0].raw_config
}

output "cluster_name" {
  description = "Name of the Kubernetes cluster"
  value       = digitalocean_kubernetes_cluster.do_cluster.name
}
