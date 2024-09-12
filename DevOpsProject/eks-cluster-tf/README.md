# EKS Cluster Terraform Runbook

This runbook guides you through the deployment of an Amazon Elastic Kubernetes Service (EKS) cluster using Terraform. The configuration supports customizable node instance types, cluster size, and related AWS resources.

# Prerequisites

Before deploying the EKS cluster, ensure you have the following:

	•	AWS CLI configured with appropriate credentials
	•	Terraform installed (version 1.0.0 or higher)
	•	S3 bucket and DynamoDB table for Terraform state management (optional but recommended for remote state)

# Infrastructure Overview

This Terraform setup provisions the following resources:

	•	An EKS cluster with the control plane.
	•	Worker nodes as part of a node group, supporting multiple instance types.
	•	Networking components (VPC, subnets, and security groups).
	•	IAM roles and policies for the EKS control plane and worker nodes.
	•	Configurable node instance types and scaling settings.

# How To Use

    - Unzip the tar
    - cd eks-cluster-tf
    - Customize Variables : You can customize the deployment by modifying the variables in the variables.tf file or using terraform.tfvars to specify values like the number of nodes, instance types, and other configurations.
    - You can also create a terraform.tfvars file for easier value management:
        instance_types = ["t3.medium", "t3.large", "t3.xlarge"]
        desired_size   = 3
        min_size       = 1
        max_size       = 6
        region         = "us-east-1"

    - Configure the backend.tf and set backend if need be, is currently set to local
    - Run terraform init, plan, apply
