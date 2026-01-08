# LAB-07: Associate Network Security Group (NSG) with Subnet using Terraform

---

## 🎯 Objective (What is this lab?)
In this lab, we **attach a Network Security Group (NSG) to a Subnet** using Terraform.

This means:
👉 All resources (like Virtual Machines) inside the subnet will follow the **same security rules**.

This is a **real-world Azure security setup** used in production.

---

## 🧒 Explanation (Like a Child 👶)
Imagine this:

- **VNet** = A big apartment building 🏢  
- **Subnet** = One floor in the building  
- **NSG** = A security guard 🚨  

If the guard is placed at the **floor entrance (subnet)**:
- Everyone living on that floor must follow the same rules  
- Example: who can enter, which doors are open, etc.

That’s exactly what we are doing in this lab.

---

## ☁️ Azure Concepts Used
- Resource Group
- Virtual Network (VNet)
- Subnet
- Network Security Group (NSG)
- NSG–Subnet Association

---

## 📁 Files in This Lab
| File | Purpose |
|----|--------|
| main.tf | Creates VNet, Subnet, NSG and association |
| variables.tf | Declares input variables |
| terraform.tfvars | Provides actual values |
| outputs.tf | Displays important outputs |
| README.md | Lab documentation |

---

## 🧠 Why Do We Attach NSG to a Subnet?
- Applies security rules to **all VMs at once**
- Easy to manage security centrally
- Avoids repeating rules on every VM
- Preferred in **real production environments**

---

## 🔐 What Security Does NSG Provide?
NSG controls:
- Inbound traffic (who can come in)
- Outbound traffic (who can go out)

Example rule in this lab:
- Allow SSH (Port 22)

---

## ▶️ Step-by-Step Execution

### Step 1: Initialize Terraform
```bash
terraform init
👉 Downloads required Azure provider.

Step 2: Preview changes
terraform plan


👉 Shows what Terraform will create.

Step 3: Create resources
terraform apply


Type:

yes


Terraform will:

Create Resource Group

Create VNet

Create Subnet

Create NSG

Attach NSG to Subnet

Step 4: Verify in Azure Portal

Go to Virtual Networks

Open the VNet

Click Subnets

Open the subnet

You will see NSG attached ✅

Step 5: Destroy resources (IMPORTANT 💸)
terraform destroy


👉 Always destroy to save Azure free credits.

📤 Outputs Explained

After apply, Terraform shows:

Subnet name

NSG name

Association ID

These confirm the NSG is successfully attached.

❓ Interview Questions You Can Answer

Q: What happens when NSG is attached to a subnet?
A: All resources in that subnet follow the NSG rules.

Q: NSG at subnet vs NIC – difference?
A:

Subnet NSG → applies to all VMs

NIC NSG → applies to one VM

Q: Which is preferred in real projects?
A: Subnet-level NSG (easier to manage).

Q: Can both NIC and subnet NSG exist together?
A: Yes, Azure evaluates both.
