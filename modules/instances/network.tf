resource "aws_eip" "ip-test-env" {
  instance = aws_instance.instance.id
  vpc      = true
}

resource "aws_route_table" "instance" {
  vpc_id = var.vpc_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = data.aws_internet_gateway.default.id
  }
  tags = {
    Name = "Bastion Route Table"
  }
}

resource "aws_route_table_association" "instance-association" {
  subnet_id      = aws_instance.instance.subnet_id
  route_table_id = aws_route_table.instance.id
}