variable "azs" {
  description = "availability-zones"
  type = list(string)
}
variable "private_subnet_cidrs" {
  description = "List of cidr for each subent"
  type = list(string)
}
variable "tags" {
  description = "Common tags for resources"
  type        = string
}
variable "name" {
  description = "Name of the VPC"
  type = string
}
variable "region" {
  description = "value"
  type = string
  default = "ap-south-1"
}
