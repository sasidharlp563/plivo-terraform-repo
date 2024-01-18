#Internat gateway for public subnets
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
}

#Elastic IP for Nat gw
resource "aws_eip" "eip-nat" {}

#Nat gateway for public subnets
resource "aws_nat_gateway" "natgw" {
    allocation_id = aws_eip.eip-nat.id
    subnet_id = aws_subnet.private[0].id
}