# Infrastructure-as-Code AKS Portfolio Project

![Terraform Logo](https://www.terraform.io/assets/images/logo-hashicorp-3f10732f.svg)
![Azure Logo](https://upload.wikimedia.org/wikipedia/commons/a/a8/Microsoft_Azure_Logo.svg)

Welcome to the Infrastructure-as-Code (IaC) AKS Portfolio Project! This repository demonstrates the power of Terraform in automating the deployment and management of Azure Kubernetes Service (AKS) clusters. By employing Infrastructure-as-Code principles, we simplify the process of creating and scaling container orchestration environments in the cloud.

## Table of Contents

- [Introduction](#introduction)
- [Getting Started](#getting-started)
- [Project Structure](#project-structure)
- [Key Features](#key-features)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Introduction

In this project, we explore the concept of Infrastructure-as-Code (IaC) and how Terraform can be utilized to provision AKS clusters on Microsoft Azure. IaC enables us to define infrastructure configurations as code, making it version-controlled, repeatable, and easier to collaborate on.

## Getting Started

To get started with deploying your AKS cluster using Terraform, follow these steps:

1. **Prerequisites:** Make sure you have the following prerequisites set up on your local machine:
   - Terraform CLI: [Installation Guide](https://learn.hashicorp.com/tutorials/terraform/install-cli)
   - Azure CLI: [Installation Guide](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)

2. **Clone the Repository:** Clone this repository to your local machine using Git.

3. **Authentication:** Log in to your Azure account using the Azure CLI:

   ```bash
   az login

4. **Terraform configuration** Update the variables.tf file with your desired configurations. Customize the cluster size, location, and other parameters as needed.

5. **Terraform initialization:** Initialize Terraform in the project directory:

   ```bash
   terraform init

6. **Terraform plan:** Generate an execution plan and review the changes that will be applied to your infrastructure:

   ```bash
    terraform plan

7. **Terraform apply:** Apply the changes to your infrastructure:

   ```bash
   terraform apply

8. **Access Kubernetes Cluster** After the deployment is complete, access the kubernetes cluster dashboard using the following command:

    ```bash
    az aks get-credentials --resource-group $(terraform output -raw resource_group_name) --name $(terraform output -raw kubernetes_cluster_name)

9. **Terraform destroy:** Destroy the infrastructure you created:

   ```bash
   terraform destroy