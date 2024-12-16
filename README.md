Here’s the table for setting up Jenkins credentials with the specified types for each provider:

# Setting Up Jenkins Credentials in Jenkins

| **Provider**       | **Credential Type**         | **Jenkins Credential Kind**   | **Details**                                                                 | **Example Credential ID**        |
|---------------------|-----------------------------|--------------------------------|-----------------------------------------------------------------------------|-----------------------------------|
| **AWS**            | Access Key ID and Secret Key | Username with Password         | - Username: AWS Access key.<br>- Password: AWS Secret Key.<br>- Used for Terraform. | `aws-credentials-id`             |
| **Azure**          | Service Principal           | Username with Password         | - Username: Azure Client ID.<br>- Password: Azure Client Secret.<br>- Used for Terraform and ACR. | `azure-credentials-id`           |
| **DockerHub**       | Username and Password       | Username with Password         | - Username: DockerHub Username.<br>- Password: DockerHub Password.<br>- Used for Docker CLI. | `dockerhub-credentials-id`       |
| **DigitalOcean**    | API Token                  | Secret Text                    | - Secret Text: DigitalOcean API Token.<br>- Used for Terraform and Container Registry. | `digitalocean-credentials-id`    |
| **OpenShift**       | API Token                  | Secret Text                    | - Secret Text: OpenShift API Token.<br>- Used for authenticating with the OpenShift Container Registry. | `openshift-credentials-id`       |
| **Azure Tenant ID**| Tenant ID                   | Secret Text                    | - Secret Text: Azure Tenant ID.<br>- Used for multi-tenant authentication scenarios. | `azure-tenant-id`                |
| **Google Cloud**    | Service Account JSON Key   | Secret File                    | - Upload the JSON key file.<br>- Used for Terraform and Google Cloud Container Registry (GCR). | `gcloud-credentials-id`          |



Here’s the table with CLI commands for logging into each provider and its respective container registry:

# CLI Commands for Logging into Providers and Their Container Registries

| **Provider**       | **CLI to Log In to Provider**                                     | **CLI to Log In to Registry**                                                                                   |
|---------------------|------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------|
| **AWS**            | `aws configure`                                                 | `aws ecr get-login-password --region <region> \| docker login --username AWS --password-stdin <account_id>.dkr.ecr.<region>.amazonaws.com` |
| **Azure**          | `az login`                                                      | `az acr login --name <registry-name>`                                                                           |
| **DockerHub**      | `docker login --username <username> --password <password>`       | `docker login --username <username> --password <password>`                                                     |
| **DigitalOcean**   | `doctl auth init`                                               | `doctl registry login`                                                                                          |
| **GCloud**         | `gcloud auth login`                                             | `gcloud auth configure-docker`                                                                                  |
| **OpenShift**      | `oc login --server=<openshift-server-url> --token=<api-token>`   | `docker login -u <username> -p $(oc whoami -t) <openshift-registry-url>`                                        |
