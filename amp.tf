resource "aws_prometheus_workspace" "prometheus" {

  alias = var.name

  tags = local.tags
}

output "prometheus_endpoint" {

  value = aws_prometheus_workspace.prometheus.prometheus_endpoint
}

# IAM permission

resource "aws_iam_role" "EKS_AMP_ServiceAccount_Role" {
  
  name  = var.SERVICE_ACCOUNT_IAM_ROLE
  description = var.SERVICE_ACCOUNT_IAM_ROLE

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Federated": "arn:aws:iam::${data.aws_caller_identity.current.account_id}:oidc-provider/${module.eks.oidc_provider}"
      },
      "Action": "sts:AssumeRoleWithWebIdentity",
      "Condition": {
        "StringEquals": {
          "${module.eks.oidc_provider}:sub": "system:serviceaccount:${var.PROM_SERVICE_ACCOUNT_NAMESPACE}:${var.SERVICE_ACCOUNT_NAME}"
        }
      }
    }
    ]
}
EOF
}

resource "aws_iam_policy" "EKS-AMP-ServiceAccount-Role-Policy" {
  

  name        = var.SERVICE_ACCOUNT_IAM_POLICY
  path        = "/"
  description = var.SERVICE_ACCOUNT_IAM_POLICY

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "aps:RemoteWrite",
                "aps:GetSeries",
                "aps:QueryMetrics",
                "aps:GetLabels",
                "aps:GetMetricMetadata"
            ],
            "Resource": "*"
        }
    ]
})
}

resource "aws_iam_role_policy_attachment" "EKS-AMP-ServiceAccount-Role-Policy-Attach" {


  role       = aws_iam_role.EKS_AMP_ServiceAccount_Role.name
  policy_arn = aws_iam_policy.EKS-AMP-ServiceAccount-Role-Policy.arn
}