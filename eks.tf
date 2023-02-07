
resource "aws_iam_role_policy_attachment" "ssm" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  for_each   = module.eks.eks_managed_node_groups
  role       = each.value.iam_role_name
}

# EKS Module

module "eks" {

  source  = "terraform-aws-modules/eks/aws"
  version = "18.21.0"

  cluster_name                    = local.name
  cluster_version                 = local.cluster_version
  # cluster_endpoint_private_access = true
  cluster_endpoint_public_access  = true

  cluster_addons = {
    coredns = {
      resolve_conflicts = "OVERWRITE"
    }
    kube-proxy = {}
    vpc-cni = {
      resolve_conflicts        = "OVERWRITE"
      service_account_role_arn = module.vpc_cni_irsa.iam_role_arn
    }
  }

  cluster_encryption_config = [{
    provider_key_arn = aws_kms_key.eks.arn
    resources        = ["secrets"]
  }]

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  

  eks_managed_node_group_defaults = {
    ami_type  = "AL2_x86_64"      
    instance_types = ["t3.medium"]

    
    iam_role_attach_cni_policy = true

    tags = {
        "k8s.io/cluster-autoscaler/my-cluster" = "owned"
        "k8s.io/cluster-autoscaler/enabled"    = "true"
      }
  }

  eks_managed_node_groups = {
    # Default node group - as provided by AWS EKS using Bottlerocket
    on_demand = {

      subnet_ids   = [module.vpc.private_subnets[0]]
      min_size     = 2
      max_size     = 10
      desired_size = 2
      
      ebs_optimized           = true


    }

    # spot = {

    #   subnet_ids   = [module.vpc.private_subnets[1]]
    #   min_size     = 1
    #   max_size     = 10
    #   desired_size = 1
    #   capacity_type  = "SPOT"

    #   ebs_optimized           = true

    #   labels = {
    #     role = "spot"
    #   }

    #   taints = [{
    #     key    = "market"
    #     value  = "spot"
    #     effect = "NO_SCHEDULE"
    #   }]


    # }

  }
  
  # aws-auth configmap
  manage_aws_auth_configmap = true

  # aws_auth_roles = var.aws_auth_roles

  aws_auth_users = var.aws_auth_users
  
  
  tags           = local.tags

}

resource "aws_iam_role_policy_attachment" "node_additional" {
  for_each = module.eks.eks_managed_node_groups

  policy_arn = "arn:aws:iam::aws:policy/CloudWatchFullAccess"
  role       = each.value.iam_role_name

}

# Supporting Resources
module "vpc_cni_irsa" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"
  version = "~> 4.12"

  role_name_prefix      = "VPC-CNI-IRSA"
  attach_vpc_cni_policy = true
  vpc_cni_enable_ipv4   = true

  oidc_providers = {
    main = {
      provider_arn               = module.eks.oidc_provider_arn
      namespace_service_accounts = ["kube-system:aws-node"]
    }
  }

  tags           = local.tags
}

resource "aws_kms_key" "eks" {
  description             = "EKS Secret Encryption Key"
  deletion_window_in_days = 7
  enable_key_rotation     = true
}

resource "aws_kms_key" "ebs" {
  description             = "Customer managed key to encrypt EKS managed node group volumes"
  deletion_window_in_days = 7
  policy                  = data.aws_iam_policy_document.ebs.json
}

# This policy is required for the KMS key used for EKS root volumes, so the cluster is allowed to enc/dec/attach encrypted EBS volumes
data "aws_iam_policy_document" "ebs" {
  # Copy of default KMS policy that lets you manage it
  statement {
    sid       = "Enable IAM User Permissions"
    actions   = ["kms:*"]
    resources = ["*"]

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"]
    }
  }
}