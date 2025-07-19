locals {
  environment = terraform.workspace
  common_tags = {
    ManagedBy   = "terraform"
    Environment = local.environment
    Owner       = "PA"
  }
}

# locals {
#   private_subnet_check = alltrue([
#     for cidr in var.private_subnet_cidrs : cidrcontains(var.vpc_cidr, cidr)
#   ])
# }

# resource "null_resource" "cidr_validation" {
#   count = local.private_subnet_check ? 0 : 1

#   provisioner "local-exec" {
#     command = "echo '❌ Error: One or more private subnets are not within VPC CIDR (${var.vpc_cidr})' && exit 1"
#   }
# }
