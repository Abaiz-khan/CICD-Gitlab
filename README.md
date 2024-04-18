# About

Welcome to two-tire application deployment! This repository contains a two-tier application with a .NET backend and a frontend in Angular. It includes all the necessary files for deploying the application on Azure AKS (Azure Kubernetes Service), including deployment definitions, Terraform code for infrastructure deployment, Docker Compose files, and more. Additionally, the repository features a GitLab pipeline for automating the CI/CD process.

## Table of Contents

- [Features](#features)
- [Prerequisites](#prerequisites)
- [Getting Started](#getting-started)
  - [Local Development](#local-development)
  - [Deployment on Azure AKS](#deployment-on-azure-aks)
- [Directory Structure](#directory-structure)
- [GitLab Pipeline](#gitlab-pipeline)
- [Contributing](#contributing)
- [License](#license)

## Features

- **Two-Tier Application**: .NET backend and Angular frontend.
- **Azure AKS Deployment**: Infrastructure deployment using Terraform and application deployment using Kubernetes manifests.
- **Dockerized**: Docker Compose files for local development and Kubernetes YAMLs for production deployment.
- **Scalable**: Utilizes the power of Kubernetes for scalable and reliable deployment.
- **GitLab Pipeline**: Automates the CI/CD process for seamless integration and deployment.

## Prerequisites

Before you begin, ensure you have met the following requirements:

- [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli) installed.
- [Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli) installed.
- [Docker](https://docs.docker.com/get-docker/) installed.
- [Angular CLI](https://angular.io/guide/setup-local) installed for frontend development.
- [.NET SDK](https://dotnet.microsoft.com/download) installed for backend development.

## Getting Started

### Local Development

To start the application locally, follow these steps:

1. Clone the repository:

    ```bash
    git clone https://github.com/your-username/your-repository.git
    ```

2. Navigate to the project directory:

    ```bash
    cd your-repository
    ```

3. Run Docker Compose to spin up the containers:

    ```bash
    docker-compose up
    ```

4. Access the frontend at `http://localhost:4200` and the backend at `http://localhost:5000`.

### Deployment on Azure AKS

To deploy the application on Azure AKS, follow these steps:

1. [Create an Azure Kubernetes Service (AKS)](https://docs.microsoft.com/en-us/azure/aks/kubernetes-walkthrough-portal).
2. [Install kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/) for managing Kubernetes clusters.
3. Authenticate with your Azure subscription using the Azure CLI:

    ```bash
    az login
    ```

4. Navigate to the `iac` directory and initialize Terraform:

    ```bash
    cd iac
    terraform init
    ```

5. Adjust the variables in `terraform.tfvars` according to your environment.
6. Deploy the infrastructure:

    ```bash
    terraform apply
    ```

7. Once the infrastructure is deployed, navigate to the `DeploymentDefinitions` directory.
8. Apply the Kubernetes manifests:

    ```bash
    kubectl apply -f .
    ```
Ensure that you have the docker images in your acr and Aks has necessary pull authentications.
9. Access your application using the external IP address of the AKS cluster.

## Directory Structure

```
.
├── Dotnet/                  # .NET backend code
├── Product-APP/             # Angular frontend code
├── DeploymentDefinitions/   # Kubernetes manifests
└── iac/                     # Terraform code for infrastructure deployment
```

## GitLab Pipeline

The repository includes a GitLab pipeline for automating the CI/CD process. The pipeline is configured to perform various tasks such as building Docker images, running tests, and deploying the application to Azure AKS.

## Contributing

Contributions are welcome! Please feel free to submit a pull request or open an issue for any bugs or feature requests.

## License

This project is licensed under the [MIT License](LICENSE).
