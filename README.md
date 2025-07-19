# 🛠️ Scalable AWS Networking with Terraform

This repo contains reusable Terraform modules and examples to plan and provision scalable AWS network infrastructure. It includes CIDR validation logic, dynamic subnet generation, and an `ip-plan.yaml` file to manage environments.

---

## 📦 Modules

### `modules/Custom_VPC`

- Creates a VPC with user-defined CIDR
- Supports multiple subnets across AZs
- Built-in Terraform validations to prevent CIDR misconfigurations

---

## ✅ Validation Example

```hcl
variable "private_subnet_cidrs" {
  type = list(string)
  validation {
    condition     = alltrue([for cidr in var.private_subnet_cidrs : can(regex("^10\\.10\\.", cidr))])
    error_message = "Each subnet must be a CIDR block within 10.10.0.0/16"
  }
}
