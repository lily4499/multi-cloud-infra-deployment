Here's a table to set up the specified Jenkins credentials:


Credential_Name          	Description	                                        Credential_Type	                        Value_or_Input	                                                   Scope
AWS_CREDENTIALS_ID	      AWS Access Key ID and Secret Access Key pair	      AWS Credentials	                        Enter the Access Key ID and Secret Key for your AWS account	       Global
AZURE_CREDENTIALS_ID	    Azure Service Principal credentials	                Microsoft Azure Service Principal	      Enter Client ID, Client Secret, Tenant ID, and Subscription ID	   Global
AZURE_TENANT_ID	          Azure Active Directory Tenant ID	                  Secret Text	                            Enter your Azure Tenant ID	                                       Global
GCLOUD_CREDENTIALS_ID    	Google Cloud Service Account JSON key	              Secret File	                             Upload the JSON key file of the GCP Service Account	             Global



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
