resource "aws_subnet" "subnets" {
  count             = length(var.subnet_cidrs)
  vpc_id            = var.vpc_id
  cidr_block        = element(var.subnet_cidrs, count.index)
  availability_zone = element(data.aws_availability_zones.available.names, count.index)

  tags = {
    Name = "Subnet ${count.index + 1}"
  }
}