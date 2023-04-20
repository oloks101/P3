# EKS Worker Nodes Resources
#  * IAM role allowing Kubernetes actions to access other AWS services
#  * EKS Node Group to launch worker nodes

resource "aws_iam_role" "mqbr-node" {
  name = "mqbr-eks-node"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "mqbr-node-AmazonEKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.mqbr-node.name
}

resource "aws_iam_role_policy_attachment" "mqbr-node-AmazonEKS_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.mqbr-node.name
}

resource "aws_iam_role_policy_attachment" "mqbr-node-AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.mqbr-node.name
}

resource "aws_eks_node_group" "mqbr" {
  cluster_name    = aws_eks_cluster.seera.name
  node_group_name = "seera"
  node_role_arn   = aws_iam_role.mqbr-node.arn
  subnet_ids      = aws_subnet.seera[*].id
  instance_types  = ["t2.micro"]
  scaling_config {
    desired_size = 2
    max_size     = 2
    min_size     = 1
  }

  remote_access {
    ec2_ssh_key = var.ssh_key_name
    source_security_group_ids = [aws_security_group.allow_http.id]
  }

  depends_on = [
    aws_iam_role_policy_attachment.mqbr-node-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.mqbr-node-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.mqbr-node-AmazonEC2ContainerRegistryReadOnly,
  ]
}
