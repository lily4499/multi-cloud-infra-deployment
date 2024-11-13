resource_group = "aksgroup"
location       = "East US"          # Choose a region with free-tier availability


#VM

admin_username = "azureuser"        # Your preferred admin username
admin_password = "Informatique1@"    # Strong password for admin (ensure it meets Azure's complexity requirements)

vm_size        = "Standard_B1s"     # Free-tier eligible VM size

# Image details for an Ubuntu Server (free-tier eligible)
image_publisher = "Canonical"
image_offer     = "UbuntuServer"
image_sku       = "18.04-LTS"


#ACR

acr_name       = "myacrlil"        # Unique ACR name (globally unique in Azure)
sku            = "Basic"            # Free tier eligible
admin_enabled  = false               # Enable admin access for local testing


#AKS

aks_cluster_name      = "myAksCluster"
node_count            = 1
node_vm_size          = "Standard_B2s"
dns_prefix            = "myaksdns"
kubernetes_version    = "1.23.5"



