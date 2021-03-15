# AppService.Specialist.Config.Backup.1
ARM Template for deploying lab for AppService Config Specialist Certification - Backup Lab #1

## This arm deployment will:

1. Create a User Assigned Identity and Role Assigment
2. Create an App Service and App Service Plan
3. Create an Azure Storage Account and Blob container

## Steps to Deploy:
1. Download the two JSON files and PS1 file to the same folder via the Green Code button.
2. Open the "azuredeploy.parameters.json" and modify the "EngineerAlias" parameter to be your alias.
3. Save and close the file.
4. Open locally your PowerShell console
5. Navigate to the folder where the deployment files are saved
6. Open .PS1 file in console
7. Login to Azure
8. Run script
