
resource "aws_route_table" "cluster" {
  vpc_id = var.vpc_id


  tags = merge( var.default_tags , local.tags )
}

resource "aws_route_table_association" "instance-association" {
  count          = length( var.cluster_subnets )
  subnet_id      =var.cluster_subnets[ count.index ].id
  route_table_id = aws_route_table.cluster.id
}
