Here’s a table for setting up Jenkins credentials with the appropriate kind for each service:

| **Service**      | **Credential ID**       | **Kind**                 | **Details**                                                    | **Description**                            |
|-------------------|-------------------------|--------------------------|----------------------------------------------------------------|--------------------------------------------|
| AWS              | aws-credentials         | Username with password   | **Username:** AWS Access Key ID<br>**Password:** AWS Secret Access Key | Used for AWS CLI and SDK authentication.  |
| Azure            | azure-credentials       | Username with password   | **Username:** Azure Service Principal App ID<br>**Password:** Azure Service Principal Secret | Used for Azure CLI and resource management. |
| DockerHub        | dockerhub-credentials   | Username with password   | **Username:** DockerHub Username<br>**Password:** DockerHub Password/Token | For Docker image pushes/pulls.             |
| DigitalOcean     | do-credentials          | Secret text              | **Secret Text:** DigitalOcean API Token                       | API token for DigitalOcean access.         |
| OpenShift        | openshift-credentials   | Secret text              | **Secret Text:** OpenShift Token                              | For OpenShift CLI and API authentication.  |
| GCloud           | gcloud-credentials      | Secret file              | **Secret File:** JSON Key File for Google Service Account     | Used for GCloud SDK and GKE access.        |


Here's a  table showing CLI commands to log in to each provider and its corresponding container registry:

| **Provider**      | **CLI to Login**                                                        | **CLI to Login to Registry**                                                       |
|--------------------|------------------------------------------------------------------------|------------------------------------------------------------------------------------|
| **AWS**           | `aws configure`                                                       | `aws ecr get-login-password --region <region> | docker login --username AWS --password-stdin <account_id>.dkr.ecr.<region>.amazonaws.com` |
| **Azure**         | `az login`                                                            | `az acr login --name <registry-name>`                                              |
| **DigitalOcean**  | `doctl auth init`                                                     | `doctl registry login`                                                             |
| **GCloud**        | `gcloud auth login`                                                   | `gcloud auth configure-docker`                                                    |
| **OpenShift**     | `oc login --server=<server-url> --token=<token>`                      | `docker login -u <username> -p $(oc whoami -t) <openshift-registry-url>`           |
| **DockerHub**     | `docker login --username <username> --password <password>`            | (Same as CLI to login, since DockerHub CLI directly logs into the registry.)       |

Notes:

    Replace <placeholders> with actual values:
        <region>: AWS region, e.g., us-east-1.
        <account_id>: AWS account ID.
        <registry-name>: Name of your Azure Container Registry (ACR).
        <server-url>: OpenShift API URL.
        <openshift-registry-url>: OpenShift image registry URL.
        <username> and <password>: DockerHub credentials.

Example for Each Provider:
AWS:

aws configure
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 123456789012.dkr.ecr.us-east-1.amazonaws.com

Azure:

az login
az acr login --name myregistry

DigitalOcean:

doctl auth init
doctl registry login

GCloud:

gcloud auth login
gcloud auth configure-docker

OpenShift:

oc login --server=https://api.sandbox-m2.ll9k.p1.openshiftapps.com:6443 --token=<your-token>
docker login -u myuser -p $(oc whoami -t) default-route-openshift-image-registry.apps.sandbox-m2.ll9k.p1.openshiftapps.com

DockerHub:

docker login --username mydockeruser --password mydockerpassword


