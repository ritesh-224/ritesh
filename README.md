# modular-infra-azure-terraform
Modular Terraform-based Azure infrastructure deployment using best IaC practices.


# ☁️ Azure Infrastructure Deployment using Terraform Modules

Welcome to this Terraform project where we deploy a complete Azure infrastructure using a **modular and reusable approach**. This project is ideal for learning, production, or scaling large Azure environments efficiently.

---

## 📚 What This Repository Contains

This repository provisions the following Azure resources using Terraform:

* ✅ Resource Group
* 🌐 Virtual Network & Subnets
* 🔐 Key Vault & Secrets
* 🧠 MSSQL Server & Database
* 💻 Virtual Machines (Linux)
* 🌐 Public IP Address
* 🔌 Network Interfaces

All of these are defined using **individual Terraform modules** to promote **reusability, scalability, and clean structure**.

---

## 🧱 Project Structure Explained

```bash
📁 modules/
├── azurerm_key_vault/               # Key Vault module
├── azurerm_key_vault_secrets/       # Secrets for Key Vault
├── azurerm_networking/              # VNet and Subnets
├── azurerm_public_ip/               # Public IP
├── azurerm_resource_group/          # Resource group
├── azurerm_sql_database/            # SQL Database
├── azurerm_sql_server/              # SQL Server
├── azurerm_virtual_machine/         # Linux VM module with NIC

📁 environment/dev
├── main.tf               # Parent file calling all modules
├── provider.tf           # Azure provider config
├── variables.tf          # Input variables for root module
├── terraform.tfvars      # Variable values (default)
```

---

## 🚀 Getting Started

### 1. Prerequisites

* Azure CLI installed (`az login` to authenticate)
* Terraform installed
* A valid Azure subscription

### 2. Clone the Repository

```bash
git clone https://github.com/ritesh-224/ritesh/tree/main/todoapp_iac
cd todoapp_iac

```

### 3. Initialize Terraform

```bash
terraform init
```

### 4. Review the Plan

```bash
terraform plan 
```

### 5. Apply the Changes

```bash
terraform apply 
```

✅ Resources will now be deployed to Azure.

---

## 🔍 Inspect Terraform State

* List all resources:

```bash
terraform state list
```

* Inspect a specific resource:

```bash
terraform state show <resource_name>
```

---

## 📌 Why Modular Structure?

* ♻️ **Reusability:** Each module can be reused in other projects.
* 🔍 **Separation of Concerns:** Easy to debug and scale.
* 🧪 **Test Individually:** Each module can be tested independently.

---

## 📥 Variables Management

* `variables.tf`: All declared variables
* `terraform.tfvars`: Default values

```

---

## 💬 Author & Contact

Developed by **Ritesh Vishwakarma**
💼 DevSecOps Engineer | Azure | Terraform Enthusiast | ADO


---

## 📃 License

This project is open-sourced under the MIT License.

---

> ⚠️ Tip: For production use, consider storing your state in a remote backend (like Azure Blob Storage) and use service principals for secure access.
