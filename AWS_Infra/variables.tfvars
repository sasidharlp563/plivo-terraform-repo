
aws_region             = "us-east-1"
aws_availability_zones = ["us-east-1a", "us-east-1b"]
env                    = "dev"

vpc_cidr       = "10.0.0.0/16"
publicsubnet0  = "10.0.1.0/24"
publicsubnet1  = "10.0.4.0/24"
privatesubnet1 = "10.0.2.0/24"
privatesubnet0 = "10.0.3.0/24"

kubernetes-version = "1.27"