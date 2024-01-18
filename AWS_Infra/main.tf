locals {
  IPSubnets = {
    # Example CIDR - 10.0.1.0/16
    privatesubnet0 = var.privatesubnet0
    privatesubnet1 = var.privatesubnet1
    publicsubnet0  = var.publicsubnet0
  }
}

module "core-networking" {
  source = "./modules/core-networking"

  vpc_cidr=var.vpc_cidr
  IPSubnets=local.IPSubnets
  aws_availability_zones=var.aws_availability_zones
}