resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "EKS Cluster"
  }
}

variable "bastion_subnet_cidrs" {
  type        = list(string)
  description = "Bastion Subnet CIDR values"
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "cluster_subnet_cidrs" {
  type        = list(string)
  description = "Cluster Subnet CIDR values"
  default     = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
}

resource "aws_subnet" "bastion_subnets" {
  count             = length(var.bastion_subnet_cidrs)
  vpc_id            = aws_vpc.main.id
  cidr_block        = element(var.bastion_subnet_cidrs, count.index)
  availability_zone = element(data.aws_availability_zones.available.names, count.index)

  tags = {
    Name = "Bastion Subnet ${count.index + 1}"
  }
}

resource "aws_subnet" "cluster_subnets" {
  count             = length(var.cluster_subnet_cidrs)
  vpc_id            = aws_vpc.main.id
  cidr_block        = element(var.cluster_subnet_cidrs, count.index)
  availability_zone = element(data.aws_availability_zones.available.names, count.index)

  tags = {
    Name = "Cluster Subnet ${count.index + 1}"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "Cluster Internet GW"
  }
}

resource "aws_eip" "nat_gateway" {
  count = length(aws_subnet.cluster_subnets)
  vpc   = true
}

resource "aws_nat_gateway" "cluster_nat_gateway" {
  count         = length(aws_subnet.cluster_subnets)
  allocation_id = aws_eip.nat_gateway[count.index].id
  subnet_id     = aws_subnet.cluster_subnets[count.index].id

  tags = {
    Name = "Cluster NAT ${count.index + 1}"
  }

  depends_on = [aws_internet_gateway.gw]
}
