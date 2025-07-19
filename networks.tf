module "my_vpc_module" {
  source = "./modules/Custom_VPC"
  name                  = var.name
  azs                   = var.azs
  tags                  = var.tags

  private_subnet_cidrs  = var.private_subnet_cidrs
}
