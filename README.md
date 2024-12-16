Here’s a Markdown table for setting up Jenkins credentials to use Terraform with AWS, Azure, DigitalOcean, and Google Cloud, including the required plugins:


# Setting Up Jenkins Credentials for Terraform Integration

| **Provider**       | **Credential Type**               | **Jenkins Credential Kind**       | **Details**                                                                 | **Example Credential ID**  | **Required Plugin**                                              |
|---------------------|-----------------------------------|------------------------------------|-----------------------------------------------------------------------------|-----------------------------|-------------------------------------------------------------------|
| **AWS**            | AWS Access Key ID and Secret Key | AWS Credentials                   | - Add AWS Access Key ID and Secret Key.<br>- Required for Terraform AWS Provider. | `aws-terraform-credentials` | [AWS Credentials Plugin](https://plugins.jenkins.io/aws-credentials/) |
| **Azure**          | Azure Service Principal          | Microsoft Azure Service Principal | - Add Azure Client ID, Client Secret, Tenant ID, and Subscription ID.<br>- Required for Terraform Azure Provider. | `azure-terraform-credentials` | [Azure Credentials Plugin](https://plugins.jenkins.io/azure-credentials/) |
| **DigitalOcean**    | API Token                        | Secret Text                       | - Add the DigitalOcean API token.<br>- Required for Terraform DigitalOcean Provider. | `digitalocean-terraform-credentials` | [Plain Credentials Plugin](https://plugins.jenkins.io/plain-credentials/) |
| **Google Cloud**    | Service Account JSON Key         | Secret File                       | - Upload the GCP Service Account JSON key.<br>- Required for Terraform GCP Provider. | `gcloud-terraform-credentials` | [Google OAuth Plugin](https://plugins.jenkins.io/google-oauth-plugin/) |

---


Here’s the Markdown table to document how to set up Jenkins credentials for AWS ECR, Azure ACR, DigitalOcean Registry, and Google Cloud GCR, including the required plugins:

# Setting Up Jenkins Credentials for Container Registries

# Setting Up Jenkins Credentials for Container Registries

| **Provider**       | **Credential Type**               | **Jenkins Credential Kind**       | **Details**                                                                 | **Example Credential ID**  | **Required Plugin**                                              |
|---------------------|-----------------------------------|------------------------------------|-----------------------------------------------------------------------------|-----------------------------|-------------------------------------------------------------------|
| **AWS ECR**         | AWS Access Key ID and Secret Key | AWS Credentials                   | - Add AWS Access Key ID and Secret Key.<br>- Use `aws ecr get-login-password` for Docker authentication. | `aws-credentials-id`         | [AWS Credentials Plugin](https://plugins.jenkins.io/aws-credentials/) |
| **Azure ACR**       | Azure Service Principal          | Microsoft Azure Service Principal | - Add Azure Client ID, Client Secret, Tenant ID, and Subscription ID.<br>- Authenticate with `az acr login`. | `azure-credentials-id`       | [Azure Credentials Plugin](https://plugins.jenkins.io/azure-credentials/) |
| **DigitalOcean**    | API Token                        | Secret Text                       | - Add the DigitalOcean API token.<br>- Authenticate with `docker login`.    | `digitalocean-credentials-id` | [Plain Credentials Plugin](https://plugins.jenkins.io/plain-credentials/) |
| **Google Cloud GCR**| Service Account JSON Key         | Secret File                       | - Upload the GCP Service Account JSON key.<br>- Use `gcloud auth configure-docker` for Docker authentication. | `gcloud-credentials-id`      | [Google OAuth Plugin](https://plugins.jenkins.io/google-oauth-plugin/) |

---










Here's a table to set up the specified Jenkins credentials:


| **Credential Name**       | **Description**                                    | **Credential Type**                  | **Value** or **Input**                     | **Scope** |
|----------------------------|----------------------------------------------------|---------------------------------------|---------------------------------------------|-----------|
| **AWS_CREDENTIALS_ID**     | AWS Access Key ID and Secret Access Key pair      | AWS Credentials                      | Enter the **Access Key ID** and **Secret Key** for your AWS account | Global    |
| **AZURE_CREDENTIALS_ID**   | Azure Service Principal credentials               | Microsoft Azure Service Principal     | Enter **Client ID**, **Client Secret**, **Tenant ID**, and **Subscription ID** | Global    |
| **AZURE_TENANT_ID**        | Azure Active Directory Tenant ID                  | Secret Text                          | Enter your Azure **Tenant ID**              | Global    |
| **GCLOUD_CREDENTIALS_ID**  | Google Cloud Service Account JSON key             | Secret File                          | Upload the JSON key file of the GCP Service Account | Global    |





Steps to Set Up Each Credential in Jenkins:

    Log in to Jenkins: Open Jenkins Dashboard.

    Navigate to Credentials:
        Go to Manage Jenkins > Manage Credentials.
        Select the appropriate domain (e.g., Global).
        Click Add Credentials.

    Select Credential Type: Choose the type of credential from the dropdown (e.g., AWS Credentials, Microsoft Azure Service Principal, Secret Text, Secret File).

    Enter Details:
        For AWS Credentials: Provide the Access Key ID and Secret Access Key.
        For Azure Service Principal: Enter the Client ID, Client Secret, Tenant ID, and Subscription ID.
        For Azure Tenant ID: Choose Secret Text and enter your Tenant ID.
        For GCP JSON Key: Choose Secret File and upload the JSON key file.

    Set ID:
        Use the corresponding ID value (e.g., aws-credentials-id, azure-credentials-id, azure-tenant-id, gcloud-credentials-id) to reference the credentials in your pipeline.

    Save: Click OK or Save to add the credential.

    Reference in Jenkins Pipeline:

    environment {
    AWS_CREDENTIALS_ID = credentials('aws-credentials-id')
    AZURE_CREDENTIALS_ID = credentials('azure-credentials-id')
    AZURE_TENANT_ID = credentials('azure-tenant-id')
    GCLOUD_CREDENTIALS_ID = credentials('gcloud-credentials-id')
}

## Required Plugins for Credentials Setup

| **Provider**     | **Plugin Name**                                         | **Description**                                                                                       | **Installation Command (CLI)**              |
|-------------------|---------------------------------------------------------|-------------------------------------------------------------------------------------------------------|----------------------------------------------|
| **AWS ECR**       | [AWS Credentials Plugin](https://plugins.jenkins.io/aws-credentials/) | Adds support for storing AWS credentials securely in Jenkins.                                         | `install-plugin aws-credentials`            |
| **Azure ACR**     | [Azure Credentials Plugin](https://plugins.jenkins.io/azure-credentials/) | Enables secure storage of Azure Service Principal credentials.                                        | `install-plugin azure-credentials`          |
| **GCP GCR**       | [Google OAuth Plugin](https://plugins.jenkins.io/google-oauth-plugin/) | Enables secure storage of Google Cloud service account keys.                                          | `install-plugin google-oauth-plugin`        |
| **Docker Hub**    | [Plain Credentials Plugin](https://plugins.jenkins.io/plain-credentials/) | Supports storing plain text secrets (e.g., username/password).                                        | `install-plugin plain-credentials`          |






***************************************************************************************************************************************************************************************************




How to set up Jenkins credentials for AWS ECR, Azure ACR, and GCP GCR:

| **Provider**     | **Credential Type**           | **Jenkins Credential Kind** | **Details**                                                                                 | **Example ID**         |
|-------------------|-------------------------------|-----------------------------|---------------------------------------------------------------------------------------------|-------------------------|
| **AWS ECR**       | AWS Access Key ID and Secret Access Key | AWS Credentials             | - Add AWS Access Key ID and Secret Key.<br>- Use `aws ecr get-login-password` for Docker authentication. | `aws-credentials-id`   |
| **Azure ACR**     | Azure Service Principal       | Microsoft Azure Service Principal | - Add Azure Client ID, Client Secret, Tenant ID, and Subscription ID.<br>- Authenticate with `az acr login`. | `azure-credentials-id` |
| **GCP GCR**       | Google Cloud Service Account JSON Key | Secret File                | - Upload the JSON key file of the GCP Service Account.<br>- Use `gcloud auth configure-docker` for Docker authentication. | `gcloud-credentials-id` |
| **Docker Hub**    | Username and Password         | Username with Password      | - Add Docker Hub username and password.<br>- Use `docker login` for Docker authentication. | `dockerhub-credentials-id` |


Pipeline Usage

Use the credentials in your Jenkinsfile as shown below:

environment {
    AWS_CREDENTIALS_ID = credentials('aws-credentials-id')
    AZURE_CREDENTIALS_ID = credentials('azure-credentials-id')
    GCLOUD_CREDENTIALS_ID = credentials('gcloud-credentials-id')
    DOCKERHUB_CREDENTIALS_ID = credentials('dockerhub-credentials-id')
}

## Required Plugins for Registry Integration

| **Provider**     | **Plugin Name**                                         | **Description**                                                                                       | **Installation Command (CLI)**              |
|-------------------|---------------------------------------------------------|-------------------------------------------------------------------------------------------------------|----------------------------------------------|
| **AWS ECR**       | [Amazon ECR Plugin](https://plugins.jenkins.io/amazon-ecr/)         | Provides integration with AWS ECR for pushing and pulling Docker images.                              | `install-plugin amazon-ecr`                 |
| **Azure ACR**     | [Azure CLI Plugin](https://plugins.jenkins.io/azure-cli/)           | Allows Jenkins to execute Azure CLI commands, such as `az acr login`.                                 | `install-plugin azure-cli`                  |
| **GCP GCR**       | [Google Kubernetes Engine Plugin](https://plugins.jenkins.io/google-kubernetes-engine/) | Facilitates interaction with Google Cloud services like GKE and GCR.                                  | `install-plugin google-kubernetes-engine`   |
| **Docker Hub**    | [Docker Pipeline Plugin](https://plugins.jenkins.io/docker-workflow/) | Provides Docker commands and authentication for Docker Hub within Jenkins pipelines.                  | `install-plugin docker-workflow`            |
