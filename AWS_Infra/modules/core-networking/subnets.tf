resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
  assign_generated_ipv6_cidr_block = false
  enable_dns_hostnames = true
  enable_dns_support = true
  tags = merge(var.tagging, tomap({"Name" = "${lookup(var.tagging,"env")}-vpc"}))
}

resource "aws_subnet" "public" {
  count=1
  vpc_id = aws_vpc.vpc.id
  cidr_block = lookup(var.IPSubnets, "publicsubnet${count.index}")
  map_public_ip_on_launch = true
  availability_zone = element(var.aws_availability_zones,count.index)
  tags = merge(var.tagging, tomap({"Name" = "${lookup(var.tagging,"env")}-publicsubnet${count.index}"}))
}

resource "aws_subnet" "private" {
  count = 2
  vpc_id = aws_vpc.vpc.id
  cidr_block = lookup(var.IPSubnets, "privatesubnet${count.index}")
  map_public_ip_on_launch = false
  availability_zone = element(var.aws_availability_zones,count.index)
  tags = merge(var.tagging, tomap({"Name" = "${lookup(var.tagging,"env")}-privatesubnet${count.index}"}))
}