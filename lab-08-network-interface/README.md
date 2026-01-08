# LAB-08: Network Interface (NIC) using Terraform

---

## 🎯 Objective (What is this lab?)
In this lab, we create an **Azure Network Interface (NIC)** using Terraform.

A NIC is required because:
👉 **Every Virtual Machine needs a network interface to communicate**

Without a NIC, a VM cannot:
- Get an IP address
- Connect to a network
- Talk to other resources

---

## 🧒 Explanation (Like a Child 👶)
Think of this:

- **VM** = Computer 🖥️  
- **NIC** = Network cable 🔌  
- **Subnet** = Local network  
- **NSG** = Security guard 🚨  

If a computer has no cable, it cannot talk to anyone.

👉 **NIC is that cable.**

---

## ☁️ Azure Concepts Used
- Resource Group  
- Virtual Network (VNet)  
- Subnet  
- Network Interface (NIC)  

---

## 📁 Files in This Lab
| File | Purpose |
|----|--------|
| main.tf | Creates VNet, Subnet, and NIC |
| variables.tf | Input variable definitions |
| terraform.tfvars | Actual values |
| outputs.tf | Displays NIC details |
| README.md | Lab documentation |

---

## 🧠 Why Do We Need a NIC?
- VM must have a NIC to start
- NIC connects VM to subnet
- NIC gets a **private IP address**
- NIC follows subnet security rules (NSG)

---

## 🔢 IP Address Explanation
- **Dynamic IP** → Azure assigns automatically
- **Private IP** → Used inside the VNet
- Public IP is NOT used in this lab

---

## ▶️ Step-by-Step Execution

### Step 1: Initialize Terraform
```bash
terraform init
👉 Downloads Azure provider.

Step 2: Review the plan
terraform plan


👉 Shows what resources will be created.

Step 3: Create resources
terraform apply


Type:

yes


Terraform will:

Create Resource Group

Create VNet

Create Subnet

Create NIC

Assign a private IP

Step 4: Verify in Azure Portal

Go to Network Interfaces

Open the NIC

Check:

Subnet

Private IP address

Step 5: Destroy resources (IMPORTANT 💸)
terraform destroy


👉 Always destroy resources to save Azure free credits.

📤 Outputs Explained

After apply, Terraform shows:

NIC name

Private IP address

This confirms the NIC is working correctly.

❓ Interview Questions You Can Answer

Q: Can a VM exist without a NIC?
A: ❌ No.

Q: Where does NIC get its IP from?
A: From the subnet.

Q: Does NIC follow NSG rules?
A: Yes, if NSG is attached to the subnet or NIC.

Q: Can one NIC be attached to multiple subnets?
A: ❌ No.

✅ Lab Status

✔ Completed
✔ Verified
✔ Destroyed
