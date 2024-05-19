

module "eks_cluster" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "my-cluster-APP"
  cluster_version = "1.29"
  vpc_id          = "vpc-09320ee98f724a391"
  subnet_ids = [ "subnet-01d7fef9db2aee366","subnet-0b08c43fa9ed19ed1","subnet-08880c5551fe2cae3"]
}