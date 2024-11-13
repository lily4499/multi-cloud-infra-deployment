# Outputs for resources created by the modules

output "vm_public_ip" {
  value = module.azure_vm.public_ip
}

output "vm_id" {
  value = module.azure_vm.vm_id
}



#ACR

output "acr_login_server" {
  description = "The login server of the ACR instance"
  value       = module.azure_acr.acr_login_server
}

output "acr_id" {
  description = "The ID of the ACR instance"
  value       = module.azure_acr.acr_id
}




#AKS

output "aks_cluster_name" {
  value = module.azure_aks.aks_cluster_name
}

output "kube_config" {
  value = module.azure_aks.kube_config
  sensitive = true
}
