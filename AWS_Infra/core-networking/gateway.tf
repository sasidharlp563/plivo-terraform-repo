#Internat gateway for public subnets
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = merge(var.tagging, tomap({"Name" = "${lookup(var.tagging,"env")}-internet-gw"}))
}

#Elastic IP for Nat gw
resource "aws_eip" "eip-nat" {
  tags = merge(var.tagging, tomap({"Name" = "${lookup(var.tagging,"env")}-nat-eip"}))
}

#Nat gateway for public subnets
resource "aws_nat_gateway" "natgw" {
    allocation_id = aws_eip.eip-nat.id
    subnet_id = aws_subnet.private[0].id
    tags = merge(var.tagging, tomap({"Name" = "${lookup(var.tagging,"env")}-nat-gw"}))
}