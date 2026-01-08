# Terraform Lab 12 – Virtual Machines with Azure Load Balancer

## 📌 Lab Overview
This lab provisions **two Linux Virtual Machines** and attaches them to an **Azure Standard Load Balancer backend pool** using **Terraform**.

The lab demonstrates **end-to-end traffic flow**, real Azure networking behavior, and how to handle **common Azure ARM and capacity issues** in real projects.

---

## 🎯 Objectives
- Create Resource Group
- Create Virtual Network and Subnet
- Create Azure Standard Load Balancer
- Create Backend Address Pool
- Create two Network Interfaces (NICs)
- Attach NICs to Load Balancer backend pool
- Create two Linux Virtual Machines
- Verify load balancing via HTTP (NGINX)

---

## 🧠 Simple Explanation
- **VMs** → Workers
- **Load Balancer** → Traffic police
- **Backend Pool** → Worker group
- **NIC association** → Registering workers
- **Health Probe** → “Are you alive?” check

---

## 🏗 Architecture
Internet
|
Public IP
|
Azure Load Balancer (Standard)
|
Backend Pool
| |
VM-0 VM-1
(NGINX) (NGINX)

yaml
Copy code

---

## 📂 Project Structure
lab-12-azure-terraform-vm-lb/
├── main.tf
├── variables.tf
└── README.md

yaml
Copy code

---

## ▶️ How to Run the Lab

### Step 1: Initialize Terraform
```bash
terraform init
Step 2: Apply (Serialized to avoid Azure ARM race conditions)
bash
Copy code
terraform apply -parallelism=1
Type yes when prompted.

🔍 How to Test
Copy the Load Balancer Public IP

Open in browser:

cpp
Copy code
http://<PUBLIC-IP>
Refresh multiple times

Expected output:

csharp
Copy code
Hello from VM-0
Hello from VM-1
This confirms load balancing is working.

⚠️ Issues Faced & How They Were Handled (IMPORTANT)
This section documents real-world Azure + Terraform problems and their resolutions.

❌ Issue 1: VM SKU not available (409 Conflict)
Error

arduino
Copy code
SkuNotAvailable: Standard_B1s / Standard_DS1_v2 not available
Cause

Azure regional capacity limits (very common in Free/Trial subscriptions)

East US is frequently saturated

Resolution

Switched region to Central India

Made VM size configurable via Terraform variables

Used variable overrides when needed

❌ Issue 2: Undeclared variables with -var
Error

rust
Copy code
Value for undeclared variable
Cause

Variables were hard-coded in main.tf

Terraform requires explicit variable declaration

Resolution

Declared variables in variables.tf

Referenced them in main.tf

Enabled safe CLI overrides

❌ Issue 3: Unsupported argument in NIC
Error

nginx
Copy code
load_balancer_backend_address_pools_ids not expected here
Cause

AzureRM provider v3 removed inline NIC backend pool attachment

Resolution

Used correct resource:

nginx
Copy code
azurerm_network_interface_backend_address_pool_association
❌ Issue 4: ResourceNotFound (404) for VNet / Subnet / Load Balancer
Error

bash
Copy code
ResourceNotFound: virtualNetworks/lab12-vnet not found
Cause

Azure ARM is eventually consistent

Terraform creates resources in parallel by default

Subnet/NIC creation happened before Azure fully registered VNet/LB

Resolution

Forced serialized execution:

bash
Copy code
terraform apply -parallelism=1
This is a real enterprise Azure best practice for networking

✅ Key Learnings
Azure ARM APIs are eventually consistent

Terraform parallelism can cause race conditions

Declaring variables properly is mandatory

Azure capacity issues are normal, not code bugs

Load Balancer backend membership happens via NIC association

Serialized Terraform applies are sometimes required

🎤 Interview Questions From This Lab
How do VMs attach to an Azure Load Balancer?

Why is NIC-to-backend-pool association required?

What causes Azure SkuNotAvailable errors?

What is Azure ARM eventual consistency?

Why use terraform apply -parallelism=1?

Difference between Load Balancer and Application Gateway?

🧹 Cleanup (IMPORTANT)
Always destroy lab resources to avoid cost:

bash
Copy code
terraform destroy
Type yes to confirm.
