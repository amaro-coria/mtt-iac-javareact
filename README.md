# Widgets Infrastructure

This repository contains the infrastructure as code for the Widgets application.

## Prerequisites

- AWS CLI configured with appropriate credentials
- Terraform >= 1.0.0
- kubectl
- helm

## Repository Structure

```
.
├── terraform/          # Terraform configuration files
│   ├── main.tf        # Main Terraform configuration
│   ├── variables.tf   # Variable definitions
│   ├── outputs.tf     # Output definitions
│   └── backend.tf     # State backend configuration
├── kubernetes/        # Kubernetes manifests
│   ├── namespace.yaml
│   ├── backend.yaml
│   ├── frontend.yaml
│   └── ingress.yaml
└── .github/
    └── workflows/     # GitHub Actions workflows
```

## Setup

1. Initialize Terraform:
```bash
cd terraform
terraform init
```

2. Create a terraform.tfvars file:
```hcl
environment    = "production"
db_username    = "your_username"
db_password    = "your_password"
```

## Deployment

The infrastructure can be deployed automatically using GitHub Actions:

1. Go to GitHub Actions
2. Select "Infrastructure Deployment"
3. Click "Run workflow"
4. Choose your environment
5. Click "Run"

## Manual Deployment

If needed, you can deploy manually:

```bash
cd terraform
terraform init
terraform plan
terraform apply

# Configure kubectl
aws eks update-kubeconfig --region us-west-2 --name widgets-cluster-production

# Deploy Kubernetes resources
kubectl apply -f ../kubernetes/
```

## Accessing the Application

After deployment, the application will be available at the ALB endpoint. Get it with:

```bash
kubectl -n widgets get ingress widgets-ingress
```

## Cleanup

To destroy all resources:

```bash
terraform destroy
```

Or use the GitHub Actions workflow with the "destroy" option.