# OpenVPN Server Deployment with Terraform

This Terraform configuration allows you to easily provision an OpenVPN server on an EC2 instance, allocate an Elastic IP, and configure the necessary security group rules.

## Purpose

The purpose of this Terraform code is to automate the deployment of an OpenVPN server infrastructure on AWS. It provisions the required resources, such as an EC2 instance, Elastic IP, and security group, and configures them to enable secure VPN connectivity.

## Prerequisites

Before using this Terraform configuration, ensure that you have the following:

- AWS account credentials with appropriate permissions
- Terraform installed on your local machine

## Configuration

1. Clone this repository to your local machine.
2. Configure the AWS provider in the providers.tf file by specifying the desired AWS region.
3. Update the instance type and key pair name in the main.tf file to match your requirements.
4. Run terraform init to initialize the Terraform configuration.
5. Run terraform apply to provision the OpenVPN server infrastructure on AWS.

## Resources Created

The Terraform configuration creates the following resources:

- EC2 instance for the OpenVPN server
- Elastic IP and association with the EC2 instance
- Security group with inbound rules for HTTPS, HTTP, OpenVPN (UDP 1194), and OpenVPN management interface (TCP 943)

## Accessing the OpenVPN Server

Once the Terraform deployment is complete, you can access the EC2 server to perform anOpenVPN server configration. After that using the Elastic IP allocated to the EC2 instance you can connect to the OpenVPN and set up the appropriate client configuration.

## Clean Up

To remove all the created resources and clean up your AWS environment, run terraform destroy after you are done using the OpenVPN server.

For detailed usage instructions and further customization options, please refer to the Terraform documentation.
