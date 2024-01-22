locals {
  IPSubnets = {
    # Example CIDR - 10.0.1.0/16
    privatesubnet0 = var.privatesubnet0
    privatesubnet1 = var.privatesubnet1
    publicsubnet0  = var.publicsubnet0
    publicsubnet1  = var.publicsubnet1
  }
  tags = {
    env         = var.env
    deployed_by = "Terraform"
  }
}
#add comment
module "core-networking" {
  source = "./modules/core-networking"

  vpc_cidr               = var.vpc_cidr
  IPSubnets              = local.IPSubnets
  aws_availability_zones = var.aws_availability_zones
  tagging                = local.tags
}

module "eks" {
  source      = "./modules/eks"
  subnet-ids  = module.core-networking.aws_subnet_private_id
  tagging     = local.tags
  eks-version = var.kubernetes-version
}