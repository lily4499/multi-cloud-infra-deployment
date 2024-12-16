pipeline {
    agent any
    parameters {
        choice(name: 'CLOUD_PROVIDER', choices: ['aws', 'azure', 'gcloud', 'digital_ocean'], description: 'Select the cloud provider for deployment')
        choice(name: 'ACTION', choices: ['apply', 'destroy'], description: 'Choose to apply or destroy the infrastructure')
        extendedChoice(name: 'RESOURCES', type: 'PT_CHECKBOX', 
                       choices: 'all\nacr\naks\nazure_VM\nk8s_do\ndo_registry\ndroplet\nec2\necr\neks\nartifact_registry\ngke\ngce\nrds', 
                       description: 'Select multiple resources to deploy')
    }
    environment {
        AWS_CREDENTIALS_ID = 'aws-credentials-id'
        AZURE_CREDENTIALS_ID = 'azure-credentials-id'
        AZURE_TENANT_ID = 'azure-tenant-id'
        GCLOUD_CREDENTIALS_ID = 'gcloud-credentials-id'
        DIGITALOCEAN_TOKEN = credentials('digitalocean-credentials-id')
    }
    stages {
        stage('Setup Credentials') {
            steps {
                script {
                    switch (params.CLOUD_PROVIDER) {
                        case 'aws':
                            withCredentials([usernamePassword(credentialsId: AWS_CREDENTIALS_ID, usernameVariable: 'AWS_ACCESS_KEY_ID', passwordVariable: 'AWS_SECRET_ACCESS_KEY')]) {
                                sh 'bash scripts/aws_config.sh'
                            }
                            break
                        case 'azure':
                            withCredentials([usernamePassword(credentialsId: AZURE_CREDENTIALS_ID, usernameVariable: 'AZURE_CLIENT_ID', passwordVariable: 'AZURE_CLIENT_SECRET'),
                                             string(credentialsId: AZURE_TENANT_ID, variable: 'AZURE_TENANT_ID')]) {
                                sh 'bash scripts/azure_config.sh'
                            }
                            break
                        case 'gcloud':
                            withCredentials([file(credentialsId: GCLOUD_CREDENTIALS_ID, variable: 'GOOGLE_APPLICATION_CREDENTIALS')]) {
                                sh 'bash scripts/gcloud_config.sh'
                            }
                            break
                        case 'digital_ocean':
                            withCredentials([string(credentialsId: 'digitalocean-credentials-id', variable: 'DIGITALOCEAN_TOKEN')]) {
                                sh 'bash scripts/digitalocean_config.sh'
                            }
                            break
                    }
                }
            }
        }
        stage('Deploy Resources') {
            steps {
                script {
                    switch (params.CLOUD_PROVIDER) {
                        case 'aws':
                            dir('terraform/aws') { deployAwsResources() }
                            break
                        case 'azure':
                            dir('terraform/azure') { deployAzureResources() }
                            break
                        case 'gcloud':
                            dir('terraform/gcloud') { deployGcloudResources() }
                            break
                        case 'digital_ocean':
                            dir('terraform/digital_ocean') { deployDigitalOceanResources() }
                            break
                    }
                }
            }
        }
    }
    post {
        always {
            cleanWs() // Cleanup workspace after the pipeline runs
        }
    }
}

def deployAwsResources() {
    if (params.RESOURCES.contains('all') || params.RESOURCES.contains('ec2')) {
        echo "Deploying AWS EC2 instance..."
        executeTerraform('ec2')
    }
    if (params.RESOURCES.contains('all') || params.RESOURCES.contains('ecr')) {
        echo "Deploying AWS ECR (Elastic Container Registry)..."
        executeTerraform('ecr')
    }
    if (params.RESOURCES.contains('all') || params.RESOURCES.contains('eks')) {
        echo "Deploying AWS EKS (Kubernetes Cluster)..."
        executeTerraform('eks')
    }
    if (params.RESOURCES.contains('all') || params.RESOURCES.contains('rds')) {
        echo "Deploying AWS RDS..."
        executeTerraform('rds')
    }
}

def deployAzureResources() {
    if (params.RESOURCES.contains('all') || params.RESOURCES.contains('vm')) {
        echo "Deploying Azure VM..."
        executeTerraform('azure_vm')
    }
    if (params.RESOURCES.contains('all') || params.RESOURCES.contains('acr')) {
        echo "Deploying Azure Container Registry..."
        executeTerraform('azure_acr')
    }
    if (params.RESOURCES.contains('all') || params.RESOURCES.contains('aks')) {
        echo "Deploying Azure Kubernetes Service..."
        executeTerraform('azure_aks')
    }
}

def deployGcloudResources() {
    if (params.RESOURCES.contains('all') || params.RESOURCES.contains('gce')) {
        echo "Deploying Google Compute Engine..."
        executeTerraform('gce_instance')
    }
    if (params.RESOURCES.contains('all') || params.RESOURCES.contains('artifact_registry')) {
        echo "Deploying Google Artifact Registry..."
        executeTerraform('artifact_registry')
    }
    if (params.RESOURCES.contains('all') || params.RESOURCES.contains('gke')) {
        echo "Deploying Google Kubernetes Engine..."
        executeTerraform('gke')
    }
}

def deployDigitalOceanResources() {
    if (params.RESOURCES.contains('all') || params.RESOURCES.contains('droplet')) {
        echo "Deploying DigitalOcean Droplet..."
        executeTerraform('droplets', "DIGITALOCEAN_TOKEN=$DIGITALOCEAN_TOKEN")
    }
    if (params.RESOURCES.contains('all') || params.RESOURCES.contains('do_registry')) {
        echo "Deploying DigitalOcean Container Registry..."
        executeTerraform('registry', "DIGITALOCEAN_TOKEN=$DIGITALOCEAN_TOKEN")
    }
    if (params.RESOURCES.contains('all') || params.RESOURCES.contains('k8s_do')) {
        echo "Deploying DigitalOcean Kubernetes..."
        executeTerraform('kubernetes_cluster', "DIGITALOCEAN_TOKEN=$DIGITALOCEAN_TOKEN")
    }
}

def executeTerraform(target, extraVars = '') {
    sh """
    terraform init
    terraform ${params.ACTION} -target=module.${target} --auto-approve ${extraVars}
    """
}
