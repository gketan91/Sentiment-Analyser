
# Create EKS cluster and node group
resource "aws_eks_cluster" "my_cluster" {
  name           = "my-eks-cluster"
  vpc_id         = aws_vpc.default.id
  role_arn       = aws_iam_role.cluster_role.arn
  kubernetes_version = "1.24" # Replace with your desired version

  # Optional: Enable public access if needed
  # publicly_accessible = true

  tags = {
    Name = "my-eks-cluster"
  }
}

resource "aws_eks_node_group" "my_node_group" {
  cluster_name = aws_eks_cluster.my_cluster.name
  node_group_name = "my-node-group"
  node_role_arn  = aws_iam_role.node_role.arn
  scaling_config {
    desired_size = 2
    max_size     = 3  # Optional: Set a maximum size for auto-scaling
  }
}