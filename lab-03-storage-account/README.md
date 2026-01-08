# LAB-03: Azure Storage Account

---

## Objective
In this lab we create a real Azure Storage Account using Terraform.

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
```bash
terraform init
```

### Step 2: Check what will be created
```bash
terraform plan
```

### Step 3: Create resources
```bash
terraform apply
```
Type **yes**

---

### Step 4: Verify in Azure Portal
- Open Azure Portal
- Check the created resource

---

### Step 5: Destroy resources (IMPORTANT)
```bash
terraform destroy
```

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
