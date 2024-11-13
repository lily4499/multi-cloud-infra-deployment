pipeline {
    agent any
    parameters {
        choice(name: 'CLOUD_PROVIDER', choices: ['aws', 'azure', 'gcloud', 'digital_ocean'], description: 'Select the cloud provider for deployment')
        choice(name: 'ACTION', choices: ['apply', 'destroy'], description: 'Choose to apply or destroy the infrastructure')
        choice(name: 'RESOURCE', choices: ['all', 'acr', 'aks', 'azure_VM', 'k8s_do', 'do_registry', 'droplet', 'ec2', 'ecr', 'eks', 'artifact_registry', 'gke', 'gce', 'rds'], description: 'Choose the resource(s) to deploy')
    }
    environment {
      //  AWS_CREDENTIALS_ID = 'aws-credentials-id'
      //  AZURE_CREDENTIALS_ID = 'azure-credentials-id'
      //  AZURE_TENANT_ID = 'azure-tenant-id'
      //  GCLOUD_CREDENTIALS_ID = 'gcloud-credentials-id'
      //  DIGITALOCEAN_CREDENTIALS_ID = 'digitalocean-credentials-id'

        AWS_CREDENTIALS_ID = credentials('aws-credentials-id')
        AZURE_CREDENTIALS_ID = credentials('azure-credentials-id')
        AZURE_TENANT_ID = credentials('azure-tenant-id')
        GCLOUD_CREDENTIALS_ID = credentials('gcloud-credentials-id')
        DIGITALOCEAN_TOKEN = credentials('digitalocean-credentials-id')


        
    }
    stages {
        stage('Setup Credentials') {
            steps {
                script {
                    if (params.CLOUD_PROVIDER == 'aws') {
                        withCredentials([usernamePassword(credentialsId: AWS_CREDENTIALS_ID, usernameVariable: 'AWS_ACCESS_KEY_ID', passwordVariable: 'AWS_SECRET_ACCESS_KEY')]) {
                            sh 'bash scripts/aws_config.sh'
                        }
                    } else if (params.CLOUD_PROVIDER == 'azure') {
                        withCredentials([usernamePassword(credentialsId: env.AZURE_CREDENTIALS_ID, usernameVariable: 'AZURE_CLIENT_ID', passwordVariable: 'AZURE_CLIENT_SECRET'),
                                         string(credentialsId: env.AZURE_TENANT_ID, variable: 'AZURE_TENANT_ID')]) {
                            sh '''
                            # Run the Azure configuration script
                            bash scripts/azure_config.sh
        
                            # Export ARM environment variables for Terraform
                            #export ARM_CLIENT_ID=$AZURE_CLIENT_ID
                            #export ARM_CLIENT_SECRET=$AZURE_CLIENT_SECRET
                            #export ARM_TENANT_ID=$AZURE_TENANT_ID
                            #export ARM_SUBSCRIPTION_ID=$(az account show --query "id" -o tsv)

                            '''
                        }
                    } else if (params.CLOUD_PROVIDER == 'gcloud') {
                        withCredentials([file(credentialsId: GCLOUD_CREDENTIALS_ID, variable: 'GOOGLE_APPLICATION_CREDENTIALS')]) {
                            sh 'bash scripts/gcloud_config.sh'
                        }
                    } else if (params.CLOUD_PROVIDER == 'digital_ocean') {
                        withCredentials([string(credentialsId: 'digitalocean-credentials-id', variable: 'DIGITALOCEAN_TOKEN')]) {
                            sh 'bash scripts/digitalocean_config.sh'
                        }
                    }
                }
            }
        }
        stage('Deploy Resources') {
            steps {
                script {
                    if (params.CLOUD_PROVIDER == 'aws') {
                        dir('terraform/aws') {
                            deployAwsResources()
                        }
                    } else if (params.CLOUD_PROVIDER == 'azure') {
                        dir('terraform/azure') {
                            deployAzureResources()
                        }
                    } else if (params.CLOUD_PROVIDER == 'gcloud') {
                        dir('terraform/gcloud') {
                            deployGcloudResources()
                        }
                    } else if (params.CLOUD_PROVIDER == 'digital_ocean') {
                        dir('terraform/digital_ocean') {
                            deployDigitalOceanResources()
                        }
                    }
                }
            }
        }
    }
    // post {
    //     always {
    //         cleanWs()
    //     }
    // }
}

def deployAwsResources() {
    if (params.RESOURCE == 'all' || params.RESOURCE == 'ec2') {
        echo "Deploying AWS EC2 instance..."
        sh 'terraform init'
        sh "terraform ${params.ACTION} -target=module.ec2 --auto-approve"
    }
    if (params.RESOURCE == 'all' || params.RESOURCE == 'ecr') {
        echo "Deploying AWS ECR (Elastic Container Registry)..."
        sh 'terraform init'
        sh "terraform ${params.ACTION} -target=module.ecr --auto-approve"
    }
    if (params.RESOURCE == 'all' || params.RESOURCE == 'eks') {
        echo "Deploying AWS EKS (Kubernetes Cluster)..."
        sh 'terraform init'
        sh "terraform ${params.ACTION} -target=module.eks --auto-approve"
    }
    if (params.RESOURCE == 'all' || params.RESOURCE == 'rds') {
        echo "Deploying AWS RDS (Amazon Relational Database Service)..."
        sh 'terraform init'
        sh "terraform ${params.ACTION} -target=module.rds --auto-approve"
    }
}

def deployAzureResources() {
    if (params.RESOURCE == 'all' || params.RESOURCE == 'vm') {
        echo "Deploying Azure VM..."
        sh 'terraform init'
        sh "terraform ${params.ACTION} -target=module.azure_vm -auto-approve"
    }
    if (params.RESOURCE == 'all' || params.RESOURCE == 'acr') {
        echo "Deploying Azure Container Registry (ACR)..."
        sh 'terraform init'
        sh "terraform ${params.ACTION} -target=module.azure_acr -auto-approve"
    }
    if (params.RESOURCE == 'all' || params.RESOURCE == 'aks') {
        echo "Deploying Azure Kubernetes Service (AKS)..."
        sh 'terraform init'
        sh "terraform ${params.ACTION} -target=module.azure_aks -auto-approve"
    }
}

def deployGcloudResources() {
    if (params.RESOURCE == 'all' || params.RESOURCE == 'gce') {
        echo "Deploying Google Compute Engine (GCE) VM..."
        sh 'terraform init'
        sh "terraform ${params.ACTION} -target=module.gce_instance -auto-approve"
    }
    if (params.RESOURCE == 'all' || params.RESOURCE == 'artifact_registry') {
        echo "Deploying Google Container Registry (GCR)..."
      //  sh 'export GOOGLE_APPLICATION_CREDENTIALS=$GOOGLE_APPLICATION_CREDENTIALS'
        sh 'terraform init'
        sh "terraform ${params.ACTION} -target=module.artifact_registry -auto-approve"
    }
    if (params.RESOURCE == 'all' || params.RESOURCE == 'gke') {
        echo "Deploying Google Kubernetes Engine (GKE)..."
        sh 'terraform init'
        sh "terraform ${params.ACTION} -target=module.gke -auto-approve"
    }
}

def deployDigitalOceanResources() {
    if (params.RESOURCE == 'all' || params.RESOURCE == 'droplet') {
        echo "Deploying DigitalOcean Droplet..."
        sh 'rm -rf .terraform'
        sh 'terraform init'
        sh "terraform ${params.ACTION} -target=module.droplets -auto-approve"
    }
    if (params.RESOURCE == 'all' || params.RESOURCE == 'do_registry') {
        echo "Deploying DigitalOcean Container Registry..."
        sh 'terraform init'
        sh "terraform ${params.ACTION} -target=module.registry -auto-approve"
    }
    if (params.RESOURCE == 'all' || params.RESOURCE == 'k8s_do') {
        echo "Deploying DigitalOcean Kubernetes..."
        sh 'terraform init'
        sh "terraform ${params.ACTION} -target=module.dok8s_cluster -auto-approve"
    }
}
