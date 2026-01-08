#!/bin/bash

# ================================
# ROOT README
# ================================
cat <<'EOF' > README.md
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
EOF


# ================================
# FUNCTION TO CREATE LAB README
# ================================
create_lab_readme () {
LAB_NAME=$1
LAB_TITLE=$2
LAB_DESC=$3

cat <<EOF > $LAB_NAME/README.md
# $LAB_TITLE

---

## Objective
$LAB_DESC

---

## Explanation (Like a Child)
- Imagine cloud like a big computer in the sky ☁️
- We use Terraform to tell the computer what to build
- This lab teaches one small but important part

---

## Files Used
| File | Purpose |
|-----|--------|
| main.tf | Main Terraform code |
| variables.tf | Input definitions |
| terraform.tfvars | Actual values |
| outputs.tf | Result values |

---

## Why This Lab Is Important
- Used in real projects
- Asked in interviews
- Required for next labs

---

## Step-by-Step Instructions

### Step 1: Initialize Terraform
\`\`\`bash
terraform init
\`\`\`

### Step 2: Check what will be created
\`\`\`bash
terraform plan
\`\`\`

### Step 3: Create resources
\`\`\`bash
terraform apply
\`\`\`
Type **yes**

---

### Step 4: Verify in Azure Portal
- Open Azure Portal
- Check the created resource

---

### Step 5: Destroy resources (IMPORTANT)
\`\`\`bash
terraform destroy
\`\`\`

---

## Interview Questions You Can Answer
- What did you create?
- Why is it needed?
- How Terraform helps?

---

## Lab Status
✔ Completed  
✔ Verified  
✔ Destroyed  

---

## Next Lab
Continue to the next folder
EOF
}


# ================================
# CREATE LAB READMES
# ================================
create_lab_readme "lab-01-resource-group" \
"LAB-01: Resource Group using Terraform" \
"In this lab we create a Resource Group, which is the base container for all Azure resources."

create_lab_readme "lab-02-variables-outputs" \
"LAB-02: Variables and Outputs" \
"In this lab we learn how to avoid hardcoding values and reuse Terraform code."

create_lab_readme "lab-03-storage-account" \
"LAB-03: Azure Storage Account" \
"In this lab we create a real Azure Storage Account using Terraform."

create_lab_readme "lab-04-vnet" \
"LAB-04: Virtual Network (VNet)" \
"In this lab we create a Virtual Network which is the backbone of Azure networking."

create_lab_readme "lab-05-subnet" \
"LAB-05: Subnet inside VNet" \
"In this lab we create a subnet which is mandatory for virtual machines."

create_lab_readme "lab-06-nsg" \
"LAB-06: Network Security Group (NSG)" \
"In this lab we create security rules to control network traffic."

echo "✅ All README files created successfully"
