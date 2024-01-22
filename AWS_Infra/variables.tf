variable "aws_region" {
  default = "us-east-1"
}


variable "aws_availability_zones" {}
variable "env" {}

variable "vpc_cidr" {}
variable "publicsubnet0" {}
variable "publicsubnet1" {}
variable "privatesubnet1" {}
variable "privatesubnet0" {}
variable "kubernetes-version" {}