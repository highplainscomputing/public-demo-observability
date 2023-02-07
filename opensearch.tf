resource "aws_opensearch_domain" "eks_logging" {
  domain_name           = var.domain_name
  engine_version = "OpenSearch_2.3"

  cluster_config {
    instance_type = "t3.small.search"
  }

#   zone_awareness_config {
#   availability_zone_count = "1"
#   }
  
  advanced_security_options {
    enabled                        = true
    anonymous_auth_enabled         = false
    internal_user_database_enabled = true
    master_user_options {
      master_user_name     = "ekslogging"
      master_user_password = "Ekslogging@123"
    }
  }

  encrypt_at_rest {
    enabled = true
  }

  domain_endpoint_options {
    enforce_https       = true
    tls_security_policy = "Policy-Min-TLS-1-2-2019-07"
  }

  node_to_node_encryption {
    enabled = true
  }

  ebs_options {
    ebs_enabled = true
    volume_size = 10
    volume_type = "gp2"
  }

  tags = local.tags
}

resource "aws_opensearch_domain_policy" "main" {
  domain_name = aws_opensearch_domain.eks_logging.domain_name

  access_policies = <<POLICIES
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": [
          "*"
        ]
      },
      "Action": [
        "es:*"
      ],
      "Resource": "arn:aws:es:us-west-2:841308375272:domain/eks-logging/*"
    }
  ]
}
POLICIES
}

# --------------------------------------------------------------------------

resource "aws_iam_role" "Fluentbit_OpenSearch_ServiceAccount_Role" {
  
  name  = var.FLUENT_BIT_SERVICE_ACCOUNT_IAM_ROLE
  description = var.FLUENT_BIT_SERVICE_ACCOUNT_IAM_ROLE

  assume_role_policy = <<EOF
{   
    "Version": "2012-10-17",
    "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Federated": "arn:aws:iam::${data.aws_caller_identity.current.account_id}:oidc-provider/${data.aws_eks_cluster.cluster.identity[0].oidc[0].issuer}"
      },
      "Action": "sts:AssumeRoleWithWebIdentity",
      "Condition": {
        "StringEquals": {
          "${data.aws_eks_cluster.cluster.identity[0].oidc[0].issuer}:sub": "system:serviceaccount:${var.FLUENT_BIT_SERVICE_ACCOUNT_NAMESPACE}:${var.FLUENT_BIT_SERVICE_ACCOUNT_NAME}"
        }
      }
    }
  ]
}
EOF
}

resource "aws_iam_policy" "FleuntBit-OpenSeacrh-ServiceAccount-Role-Policy" {

  name        = var.FLUENT_BIT_SERVICE_ACCOUNT_IAM_POLICY
  path        = "/"
  description = var.FLUENT_BIT_SERVICE_ACCOUNT_IAM_POLICY

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": [
                "es:ESHttp*"
            ],
            "Resource": "arn:aws:es:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:domain/${aws_opensearch_domain.eks_logging.domain_name}",
            "Effect": "Allow"
        }
    ]
})
}

resource "aws_iam_role_policy_attachment" "Fluentbit-OpenSearch-ServiceAccount-Role-Policy-Attach" {
  role       = aws_iam_role.Fluentbit_OpenSearch_ServiceAccount_Role.name
  policy_arn = aws_iam_policy.FleuntBit-OpenSeacrh-ServiceAccount-Role-Policy.arn
}