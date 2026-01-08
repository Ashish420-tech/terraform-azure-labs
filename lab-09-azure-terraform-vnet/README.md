# Azure Terraform Lab 9 – VNet, Subnets & NSG

## Objective
Create Azure networking using Terraform.

## Architecture
Resource Group
└── Virtual Network (10.0.0.0/16)
    ├── Frontend Subnet (10.0.1.0/24)
    ├── Backend Subnet (10.0.2.0/24)
    └── NSG attached to Frontend

## Files
- main.tf        → Resources
- variables.tf   → Variables
- terraform.tfvars → Values

## Run
terraform init
terraform plan
terraform apply

## Interview Focus
- Why VNet?
- Why Subnets?
- What is NSG?
Resources created:

Resource Group

Virtual Network (VNet)

Frontend Subnet

Backend Subnet

Network Security Group (NSG)

NSG association to frontend subnet

This lab is a foundation lab for:

Azure Virtual Machines

AKS

Load Balancer

Application Gateway

Enterprise Terraform projects

🧠 Simple Explanation (Beginner Friendly)

Terraform → Automation robot

Azure → Cloud city

VNet → City boundary

Subnet → Areas inside the city

NSG → Security guard controlling traffic

🏗 Architecture
Resource Group
 └── Virtual Network (10.0.0.0/16)
      ├── Frontend Subnet (10.0.1.0/24)
      ├── Backend Subnet  (10.0.2.0/24)
      └── Network Security Group
            └── Attached to Frontend Subnet

📂 File Structure
lab-09-azure-terraform-vnet/
├── main.tf
├── variables.tf
├── terraform.tfvars
└── README.md

▶️ How to Run the Lab
terraform init
terraform plan
terraform apply


Type yes when prompted.

⚠️ Issues Faced During This Lab (IMPORTANT)

This section documents real-world Terraform + Azure issues and how they were fixed.

❌ Issue 1: Python script not running

Error

import: command not found


Cause

Python script was executed as a shell script.

Fix
Run Python script correctly:

python3 create_lab9_terraform.py


OR add shebang and permissions:

#!/usr/bin/env python3
chmod +x create_lab9_terraform.py

❌ Issue 2: Azure subscription ID could not be determined

Error

subscription ID could not be determined and was not specified


Cause

Terraform could not detect Azure CLI authentication context

Common in WSL / mixed Windows–Linux environments

Fix

Login to Azure:

az login


Set subscription explicitly:

az account set --subscription <SUBSCRIPTION_ID>


Force Terraform to use Azure CLI:

provider "azurerm" {
  features {}
  use_cli = true
}

❌ Issue 3: Duplicate provider configuration

Error

Duplicate provider configuration for "azurerm"


Cause

Multiple provider "azurerm" blocks existed in main.tf

Fix

Keep only one provider block

Remove all duplicates

❌ Issue 4: Invalid character in Terraform file

Error

Argument or block definition required


Cause

A stray character (o) existed in main.tf

Fix

Removed invalid character

Ensured all blocks had valid syntax

❌ Issue 5: Terraform init failing repeatedly

Cause

Cached provider state after fixing files

Fix
Full reset:

rm -rf .terraform
rm -f .terraform.lock.hcl
terraform init

✅ Final Working Configuration

Single azurerm provider

use_cli = true

Azure CLI authenticated

Clean Terraform initialization

🔍 Validation Checklist

After terraform apply, verify in Azure Portal:

Resource Group exists

VNet created

Two subnets created

NSG created

NSG attached to frontend subnet

🎤 Interview Questions Based on This Lab

Why Terraform couldn’t detect Azure subscription?

Difference between Azure CLI auth and Service Principal?

Why only one provider block is allowed?

What happens if NSG is not attached?

Why separate frontend and backend subnets?

🧠 Key Learnings

Terraform validates configuration before init

Azure authentication is environment-sensitive

Provider misconfiguration is a common real-world issue

Debugging Terraform is a critical DevOps skill
