locals {
  environment = terraform.workspace
  common_tags = {
    ManagedBy   = "terraform"
    Environment = local.environment
    Owner       = "PA"
  }
}
