

# module "eks_cluster" {
#   source          = "terraform-aws-modules/eks/aws"
#   cluster_name    = "Three-Tier-K8s-EKS-Cluster"
#   cluster_version = "1.28"
#   vpc_id          = "vpc-09320ee98f724a391"
#   subnet_ids = [ "subnet-01d7fef9db2aee366","subnet-0b08c43fa9ed19ed1","subnet-08880c5551fe2cae3"]
# }


module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = "Three-Tier-K8s-EKS-Cluster"
  cluster_version = "1.29"

  cluster_endpoint_public_access  = true

  cluster_addons = {
    coredns = {
      most_recent = true
    }
    kube-proxy = {
      most_recent = true
    }
    vpc-cni = {
      most_recent = true
    }
  }

  vpc_id                   = "vpc-09320ee98f724a391"
  subnet_ids               = ["subnet-01d7fef9db2aee366","subnet-0b08c43fa9ed19ed1","subnet-08880c5551fe2cae3"]
  control_plane_subnet_ids = ["subnet-01d7fef9db2aee366","subnet-0b08c43fa9ed19ed1","subnet-08880c5551fe2cae3"]

  # EKS Managed Node Group(s)
  eks_managed_node_group_defaults = {
    instance_types = ["t2.micro"]
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
          policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSViewPolicy"
          access_scope = {
            namespaces = ["default"]
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