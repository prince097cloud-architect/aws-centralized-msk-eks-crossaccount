variable "azs" {
  description = "availability-zones"
  type = list(string)
}
variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
  default     = "10.10.0.0/16"
}
variable "tags" {
  description = "Common tags for resources"
  type        = string
}
variable "name" {
  description = "Name of the VPC"
  type = string
}
# variable "private_subnet_cidrs" {
#   type = list(string)
# }


variable "private_subnet_cidrs" {
  description = "List of private subnet CIDRs"
  type        = list(string)

  validation {
    condition = alltrue([
      for cidr in var.private_subnet_cidrs : can(regex("^10\\.10\\.(\\d{1,3})\\.(\\d{1,3})/(1[6-9]|2[0-9]|3[0-2])$", cidr))
    ])
    error_message = "Each subnet must be a valid CIDR block within 10.10.0.0/16 (e.g., 10.10.x.x/24)."
  }
}



