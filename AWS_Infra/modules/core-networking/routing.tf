resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc.id
  tags = merge(var.tagging, tomap({"Name" = "${lookup(var.tagging,"env")}-public_route_table"}))
}

resource "aws_route" "igw_routes" {
  route_table_id = aws_route_table.public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.igw.id
}

resource "aws_route_table_association" "public_table-rules" {
  route_table_id = aws_route_table.public_route_table.id
  subnet_id = aws_subnet.public[0].id
}


resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.vpc.id
  tags = merge(var.tagging, tomap({"Name" = "${lookup(var.tagging,"env")}-private_route_table"}))
}

resource "aws_route" "nat_routes" {
    route_table_id = aws_route_table.private_route_table.id
    destination_cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.natgw.id
}

resource "aws_route_table_association" "private_table-rules" {
  count = 2
  route_table_id = aws_route_table.private_route_table.id
  subnet_id = aws_subnet.private[count.index].id
}