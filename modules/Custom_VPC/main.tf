resource "aws_vpc" "Infra_custom_vpc" {
  cidr_block=var.vpc_cidr
  tags = merge(local.common_tags,
  {
    Name="${var.name}-VPC"    
  }
  )
}
resource "aws_internet_gateway" "Infra_custom_igw" {
  vpc_id = aws_vpc.Infra_custom_vpc.id
  tags = merge(local.common_tags,
  {
    Name="${var.name}-IGW"    
  }
  )
}
resource "aws_subnet" "private" {
  count = length(var.private_subnet_cidrs)
  vpc_id = aws_vpc.Infra_custom_vpc.id
  cidr_block = var.private_subnet_cidrs[count.index] // cretes subnet by looping into the list provided 
  availability_zone = var.azs[count.index]
#   under cidr variables for each subnets
 tags = merge(local.common_tags,
  {
    Name = "Private Subnet-${count.index + 1}"
  }
  )//It will automatically create the tags with counter as 1, 2 3
}

resource "aws_route_table" "Infra_custom_rt" {
  vpc_id = aws_vpc.Infra_custom_vpc.id
   tags = merge(local.common_tags,
  {
    Name="${var.name}-RT"    
  }
   )
}

resource "aws_route_table_association" "Infra_custom_rt_assc" {
  count = length(aws_subnet.private)
  route_table_id = aws_route_table.Infra_custom_rt.id
  subnet_id = aws_subnet.private[count.index].id
}

