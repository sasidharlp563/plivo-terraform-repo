resource "aws_eks_cluster" "eks-cluster" {
    name = "${lookup(var.tagging,"env")}-eks"
    role_arn = aws_iam_role.eks-iam-role.arn
    version = var.eks-version
    vpc_config {
      subnet_ids = var.subnet-ids
    }
  tags = merge(var.tagging,tomap({"Name"= "${lookup(var.tagging,"env")}-eks"}))
  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly-EKS
  ]
}



resource "aws_eks_node_group" "eks-node-group" {

    cluster_name = aws_eks_cluster.eks-cluster.name
    node_group_name = "${lookup(var.tagging,"env")}-node-group"
    node_role_arn = aws_iam_role.workernodes-role.arn
    subnet_ids=var.subnet-ids
    instance_types = ["t2.micro"]
    scaling_config {
        desired_size = 1
        max_size   = 2
        min_size   = 1
    }
    launch_template {
      id      = aws_launch_template.node-template.id
      version = aws_launch_template.node-template.latest_version
    }
    depends_on = [
        aws_iam_role_policy_attachment.EC2InstanceProfileForImageBuilderECRContainerBuilds,
        aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly,
        aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy,
        aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy
    ]
}