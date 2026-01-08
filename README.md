# Terraform Azure Labs 🚀

This repository contains **step-by-step Terraform labs using Microsoft Azure**.
The labs are written in a very simple way so that **even a beginner or a child can understand**.

---

## What is Terraform? (Very Simple)
Terraform is a tool that helps us **create cloud resources using code** instead of clicking buttons.

Example:
- Write code → Run command → Azure resources are created automatically

This is called **Infrastructure as Code (IaC)**.

---

## What is Azure?
Azure is Microsoft’s cloud platform where we create:
- Networks
- Storage
- Virtual Machines
- Security rules

Terraform helps us manage Azure **safely, repeatedly, and automatically**.

---

## Repository Structure
Each lab is in its own folder.

terraform-azure-labs/
├── lab-01-resource-group
├── lab-02-variables-outputs
├── lab-03-storage-account
├── lab-04-vnet
├── lab-05-subnet
├── lab-06-nsg


Each lab contains:
- main.tf
- variables.tf
- terraform.tfvars
- outputs.tf
- README.md

---

## Labs Overview
| Lab | Topic | Purpose |
|----|------|--------|
| Lab 01 | Resource Group | Terraform basics |
| Lab 02 | Variables & Outputs | Reusable code |
| Lab 03 | Storage Account | Real Azure service |
| Lab 04 | Virtual Network | Azure networking |
| Lab 05 | Subnet | Network segmentation |
| Lab 06 | NSG | Network security |

---

## Important Rules
- Terraform state files are NOT committed
- Resources are destroyed after labs
- Follows real DevOps best practices

---

## Author
Ashish Mondal  
Terraform | Azure | DevOps
