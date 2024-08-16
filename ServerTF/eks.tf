

# module "eks_cluster" {
#   source          = "terraform-aws-modules/eks/aws"
#   cluster_name    = "Three-Tier-K8s-EKS-Cluster"
#   cluster_version = "1.28"
#   vpc_id          = "vpc-039ddf21eb0d40a2a"
#   subnet_ids = [ "subnet-01d7fef9db2aee366","subnet-0b08c43fa9ed19ed1","subnet-08880c5551fe2cae3"]
# }


module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = "Three-Tier-K8s-EKS-Cluster"
  cluster_version = "1.29"

  vpc_id = "vpc-039ddf21eb0d40a2a"
  subnet_ids   = ["subnet-00f6193907426233d","subnet-073139c2b6156c2cf","subnet-0cc6efd16f1e9981a"]
  control_plane_subnet_ids = ["subnet-00f6193907426233d","subnet-073139c2b6156c2cf","subnet-0cc6efd16f1e9981a"]

  cluster_endpoint_public_access  = false

  # cluster_addons = {
  #   # coredns = {
  #   #   most_recent = false
  #   # }
  #   # kube-proxy = {
  #   #   most_recent = false
  #   # }
  #   # vpc-cni = {
  #   #   most_recent = false

  #   # }

  # }

      
      


  # EKS Managed Node Group(s)
  eks_managed_node_group_defaults = {
    instance_types = ["t2.medium"]
    vpc_id =  "vpc-039ddf21eb0d40a2a"
    security_groups = ["My-CustomSG"]
  }

  eks_managed_node_groups = {
    example = {
      min_size     = 1
      max_size     = 3
      desired_size = 1

      instance_types = ["t2.medium"]
      capacity_type  = "SPOT"
      security_groups = ["My-CustomSG"]
    }
  }

  # Cluster access entry
  # To add the current caller identity as an administrator
  enable_cluster_creator_admin_permissions = true

  access_entries = {
    # One access entry with a policy associated
    example = {
      kubernetes_groups = []
      principal_arn     = "arn:aws:iam::453231788378:user/MyCrystalRoot-IAM"

      policy_associations = {
        example = {
          policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
          access_scope = {
            namespaces = ["*"]
            type       = "namespace"
          }
        }
      }
    }
  }

  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}