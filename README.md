# Infrastructure-as-Code AKS Portfolio Project

![Azure Logo](https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Microsoft_Azure.svg/300px-Microsoft_Azure.svg.png)
![Terraform Logo](https://upload.wikimedia.org/wikipedia/commons/thumb/0/04/Terraform_Logo.svg/600px-Terraform_Logo.svg.png)
![Kubernetes Logo](https://upload.wikimedia.org/wikipedia/commons/thumb/3/39/Kubernetes_logo_without_workmark.svg/168px-Kubernetes_logo_without_workmark.svg.png)

Welcome to the Infrastructure-as-Code (IaC) AKS Portfolio Project! This repository demonstrates the power of Terraform in automating the deployment and management of Azure Kubernetes Service (AKS) clusters. By employing Infrastructure-as-Code principles, we simplify the process of creating and scaling container orchestration environments in the cloud.

## Table of Contents

- [Introduction](#introduction)
- [Provision AKS Cluster & Azure Container Registry using Terraform](#provison-aks-cluster--azure-container-registry-using-terraform)
- [Deploy sample vote app to AKS cluster](#deploy-sample-vote-app-to-aks-cluster)
- [Clean up resources](#clean-up-resources)

## Introduction

In this project, we explore the concept of Infrastructure-as-Code (IaC) and how Terraform can be utilized to provision AKS clusters on Microsoft Azure. IaC enables us to define infrastructure configurations as code, making it version-controlled, repeatable, and easier to collaborate on. Futhermore, we deploy a sample application to the AKS cluster to demonstrate the power of Infrastructure-as-Code. The source code of the sample application can be found here: https://github.com/Azure-Samples/azure-voting-app-redis

## Provison AKS Cluster & Azure Container Registry using Terraform

To get started with deploying your AKS cluster using Terraform, follow these steps:

1. **Prerequisites:** Make sure you have the following prerequisites set up on your local machine:
   - Terraform CLI: [Installation Guide](https://learn.hashicorp.com/tutorials/terraform/install-cli)
   - Azure CLI: [Installation Guide](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)

2. **Clone the Repository:** Clone this repository to your local machine using Git.

3. **Authentication:** Log in to your Azure account using the Azure CLI:

   ```bash
   az login

4. **Terraform configuration:** Update the variables.tf file with your desired configurations. Customize the cluster size, location, and other parameters as needed.

5. **Terraform initialization:** Initialize Terraform in the project directory:

   ```bash
   terraform init

6. **Terraform plan:** Generate an execution plan and review the changes that will be applied to your infrastructure:

   ```bash
    terraform plan

7. **Terraform apply:** Apply the changes to your infrastructure:

   ```bash
   terraform apply

8. **Configure kubectl:** After the deployment is complete, configure kubectl using the following command:

    ```bash
    az aks get-credentials --resource-group $(terraform output -raw resource_group_name) --name $(terraform output -raw kubernetes_cluster_name)

9. **Access Kubernetes Cluster Dashboard:** After the deployment is complete, access the kubernetes cluster dashboard using the following command:

    ```bash
    az aks browse --resource-group $(terraform output -raw resource_group_name) --name $(terraform output -raw kubernetes_cluster_name)

## Deploy sample vote app to AKS cluster

1. **Login to container registry & retrieve LoginServer address:** Login to the newly created azure container registry and retrieve the LoginServer address using the following commands: 

   ```bash
   az acr login --name $(terraform output -raw container_registry_name)

   az acr list --resource-group $(terraform output -raw resource_group_name) --query "[].{acrLoginServer:loginServer}" --output table

2. **Tag & push image to container registry:** Tag the local vote front image and push it to the container registry using the following commands:

   ```bash
   docker tag mcr.microsoft.com/azuredocs/azure-vote-front:v1 <acrLoginServer>/azure-vote-front:v1

   docker push <acrLoginServer>/azure-vote-front:v1

3. **Update the manifest file**: Update the manifest file with the LoginServer address of the container registry.

```yaml
containers:
   - name: azure-vote-front
      image: <acrLoginServer>/azuredocs/azure-vote-front:v1
```

4. **Deploy the application to AKS cluster:** Deploy the application to the AKS cluster using the following command:

   ```bash
   kubectl apply -f azure-vote-all-in-one-redis.yaml

5. **Access the application:** Access the application using the following command:

   ```bash
   kubectl get service azure-vote-front --watch

## Clean up resources

1. **Terraform destroy:** Destroy the infrastructure you created:

   ```bash
   terraform destroy