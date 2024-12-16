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



############################################################################################


Here are the kubectl commands for creating a Docker registry secret (my-pull-secret) for each provider:


AWS Elastic Container Registry (ECR)

kubectl create secret docker-registry my-pull-secret \
  --docker-server=<account_id>.dkr.ecr.<region>.amazonaws.com \
  --docker-username=AWS \
  --docker-password=$(aws ecr get-login-password --region <region>) \
  --docker-email=<email>

    Replace <account_id> with your AWS account ID.
    Replace <region> with your AWS region (e.g., us-east-1).
    Replace <email> with your email address.

Azure Container Registry (ACR)

kubectl create secret docker-registry my-pull-secret \
  --docker-server=<registry-name>.azurecr.io \
  --docker-username=<client-id> \
  --docker-password=<client-secret> \
  --docker-email=<email>

    Replace <registry-name> with your Azure Container Registry name.
    Replace <client-id> and <client-secret> with your Azure Service Principal credentials.
    Replace <email> with your email address.

DockerHub

kubectl create secret docker-registry my-pull-secret \
  --docker-server=https://index.docker.io/v1/ \
  --docker-username=<dockerhub-username> \
  --docker-password=<dockerhub-password> \
  --docker-email=<email>

    Replace <dockerhub-username> and <dockerhub-password> with your DockerHub credentials.
    Replace <email> with your email address.

DigitalOcean Container Registry

kubectl create secret docker-registry my-pull-secret \
  --docker-server=registry.digitalocean.com \
  --docker-username=<api-token> \
  --docker-password=<api-token> \
  --docker-email=<email>

    Replace <api-token> with your DigitalOcean API token.
    Replace <email> with your email address.

Google Container Registry (GCR)

kubectl create secret docker-registry my-pull-secret \
  --docker-server=gcr.io \
  --docker-username=_json_key \
  --docker-password="$(cat <path-to-service-account-key>)" \
  --docker-email=<email>

    Replace <path-to-service-account-key> with the path to your GCP service account JSON key.
    Replace <email> with your email address.

OpenShift Container Registry

kubectl create secret docker-registry my-pull-secret \
  --docker-server=default-route-openshift-image-registry.apps.<openshift-cluster> \
  --docker-username=<openshift-username> \
  --docker-password=$(oc whoami -t) \
  --docker-email=<email>

    Replace <openshift-cluster> with your OpenShift cluster domain.
    Replace <openshift-username> with your OpenShift username.
    Replace <email> with your email address.




Then reference this secret in your Pod or Deployment YAML under imagePullSecrets:
```yaml
spec:
  containers:
  - name: my-app
    image: myregistry/myapp:latest
  imagePullSecrets:
  - name: my-pull-secret


This ensures your Kubernetes pods can authenticate to private container registries.
