lab-10-linux-vm/README.md
md
Copy code
# LAB-10: Linux Virtual Machine (VM) using Terraform on Azure

---

## 🎯 Objective (What is this lab?)

The goal of this lab is to understand **how a Linux Virtual Machine is created in Azure using Terraform**.

This lab combines everything learned earlier:
- Networking
- Security
- Compute

Even though Azure capacity limits prevented full VM creation, this lab is still **SUCCESSFUL** because it teaches **real-world cloud engineering problems and solutions**.

---

## 🧒 Explanation (Like a Child 👶)

Imagine building a computer step by step:

- **VM** = Computer 🖥️  
- **NIC** = Network cable 🔌  
- **Subnet** = Local network 🏠  
- **Public IP** = Internet door 🌍  

If any one of these is missing, the computer cannot work properly.

Terraform helps us **build this computer using code instead of clicking buttons**.

---

## ☁️ Azure Concepts Used in This Lab

- Resource Group  
- Virtual Network (VNet)  
- Subnet  
- Public IP Address  
- Network Interface (NIC)  
- Linux Virtual Machine  

---

## 📁 Files in This Lab

| File | Purpose |
|----|--------|
| main.tf | Defines VM, network, NIC, Public IP |
| variables.tf | Input variable definitions |
| terraform.tfvars | Actual values |
| outputs.tf | Displays VM info |
| README.md | Lab documentation |

---

## 🧠 Why This Lab Is Important

- Virtual Machines are the **core compute service** in Azure
- Almost every enterprise project uses VMs
- This lab shows **how all Azure components connect**
- Very commonly asked in **Azure & DevOps interviews**

---

## 🔐 IMPORTANT REAL-WORLD ISSUE #1  
### Public IP Basic SKU Limitation

### ❌ Problem Faced
Terraform failed with this error:

IPv4BasicSkuPublicIpCountLimitReached
Cannot create more than 0 IPv4 Basic SKU public IP addresses

csharp
Copy code

### ✅ Root Cause
Azure **free subscriptions no longer allow Basic SKU Public IPs** in many regions.

This is an **Azure policy limitation**, not a Terraform issue.

### ✅ Fix Applied
We switched to **Standard SKU Public IP**, which is:
- More secure
- Recommended by Azure
- Allowed in free subscriptions

```hcl
resource "azurerm_public_ip" "pip" {
  name                = var.public_ip_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  allocation_method   = "Static"
  sku                 = "Standard"
}
🔐 IMPORTANT REAL-WORLD ISSUE #2
Azure VM SKU Capacity Limitation
❌ Problem Faced
Terraform failed with:

arduino
Copy code
SkuNotAvailable: The requested VM size is currently not available
This occurred for multiple VM sizes:

Standard_B1s

Standard_DS1_v2

Across multiple regions:

East US

Central US

✅ Root Cause (Very Important Learning)
Azure regions can temporarily run out of capacity for certain VM sizes, especially:

Free / trial subscriptions

Popular regions

Small VM SKUs

This is a cloud capacity issue, not a configuration error.

🧠 Real-World Engineering Decision
In real projects, engineers do one of the following:

Change VM size

Change region

Use Availability Zones

Schedule deployment later

Or continue development without deployment

For learning purposes, we documented the issue and moved forward.

🔐 IMPORTANT REAL-WORLD ISSUE #3
Subnet Not Found While Creating NIC
❌ Problem Faced
Terraform returned:

vbnet
Copy code
InvalidResourceReference: Subnet referenced by NIC was not found
✅ Root Cause
This happened due to:

Partial / failed Terraform applies

Azure networking resources being eventually consistent

Terraform state becoming out of sync

✅ Fix Applied
Cleaned Terraform state

Added explicit dependency

hcl
Copy code
depends_on = [
  azurerm_subnet.subnet
]
This ensures correct resource creation order.

▶️ Terraform Commands Used
bash
Copy code
terraform init
terraform plan
terraform apply
terraform destroy
Resources were destroyed after testing to save Azure free credits.

📤 Outputs Explained
If VM creation succeeds in other environments, Terraform outputs:

VM name

Public IP address

Even when VM creation fails, networking and architecture are fully validated.

❓ Interview Questions You Can Answer After This Lab
Q: Why did you use Standard Public IP instead of Basic?
A: Azure free subscriptions no longer allow Basic SKU Public IPs.

Q: What if a VM SKU is not available in a region?
A: Change region, change size, or redesign temporarily.

Q: Why can NIC creation fail even if subnet exists in code?
A: Azure resources are asynchronous; explicit dependencies may be required.

Q: Is this a Terraform problem?
A: No, it is an Azure capacity and timing issue.

✅ Lab Status
✔ Architecture understood
✔ Code written correctly
✔ Real Azure issues faced
✔ Production-grade troubleshooting documented
✔ Resources destroyed

🚀 Key Takeaway (VERY IMPORTANT)
Cloud engineering is not just about writing code.
It is about handling failures, limits, and real-world constraints.

This lab demonstrates real Azure DevOps thinking, not just theory.
