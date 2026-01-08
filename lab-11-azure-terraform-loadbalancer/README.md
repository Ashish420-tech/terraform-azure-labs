# Terraform Lab 11 – Azure Load Balancer (From Scratch)

## Objective
Create an Azure Standard Load Balancer using Terraform from zero.

## Resources
- Resource Group
- VNet & Subnet
- Public IP
- Load Balancer
- Backend Pool
- Health Probe
- Load Balancing Rule

## Run
terraform init
terraform plan
terraform apply

## Notes
- No VMs attached yet
- Backend pool will be used in Lab 12
# Terraform Lab 11 – Azure Load Balancer (From Scratch)

## 📌 Lab Overview
This lab demonstrates how to provision an **Azure Standard Load Balancer** using **Terraform**, starting from zero infrastructure.

This lab focuses on **Layer 4 load balancing concepts** and prepares the foundation for attaching virtual machines in the next lab.

---

## 🎯 Objectives
Create the following resources using Terraform:
- Resource Group
- Virtual Network (VNet)
- Subnet
- Public IP (Standard SKU)
- Azure Standard Load Balancer
- Backend Address Pool
- Health Probe
- Load Balancing Rule

⚠️ No virtual machines are attached in this lab.

---

## 🧠 Simple Explanation
- **Terraform** → Automation tool
- **Azure** → Cloud platform
- **Load Balancer** → Traffic distributor
- **Public IP** → Entry point
- **Backend Pool** → Empty container for VMs
- **Health Probe** → Checks service health

---

## 🏗 Architecture
Internet
|
Public IP
|
Azure Load Balancer
|
Backend Pool (empty)

yaml
Copy code

---

## 📂 Project Structure
lab-11-azure-terraform-loadbalancer/
├── main.tf
├── variables.tf
├── terraform.tfvars
└── README.md

yaml
Copy code

---

## ▶️ How to Run
```bash
terraform init
terraform plan
terraform apply
Type yes when prompted.

🧹 How to Clean Up (Destroy)
After completing the lab, destroy all resources to avoid charges:

bash
Copy code
terraform destroy
Type yes when prompted.

🔍 Validation Checklist
After terraform apply, verify in Azure Portal:

Resource Group exists

VNet and subnet created

Standard Public IP created

Standard Load Balancer created

Backend pool exists

Health probe configured on port 80

⚠️ Issues Faced & Resolutions
Issue 1: Azure authentication not detected
Cause

Terraform could not read Azure CLI context

Resolution

Logged in using az login

Used use_cli = true in provider block

Issue 2: Variable declaration error
Cause

Variables were declared in terraform.tfvars

Resolution

Declared variables in variables.tf

Assigned values only in terraform.tfvars

🎤 Interview Questions Based on This Lab
Can an Azure Load Balancer exist without backend VMs?

Difference between Basic and Standard Load Balancer?

What is the role of a health probe?

What layer does Azure Load Balancer operate on?

Difference between Load Balancer and Application Gateway?

🧠 Key Learnings
Terraform validates configuration before execution

.tfvars files are for value assignment only

Standard Load Balancer is production-ready

Backend pools can be populated later


