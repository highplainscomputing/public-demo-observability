resource "aws_grafana_workspace" "grafana" {


  name                     = var.name
  account_access_type      = "CURRENT_ACCOUNT"
  authentication_providers = ["AWS_SSO"]
  permission_type          = "SERVICE_MANAGED"
  data_sources             = ["CLOUDWATCH", "PROMETHEUS", "XRAY"]
  role_arn                 = aws_iam_role.assume.arn
}



resource "aws_iam_role" "assume" {
  name = "grafana-assume"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "grafana.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_policy" "grafana" {


  name        = "grafana_policy"
  path        = "/"
  description = "grafana policy"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
            "Effect": "Allow",
            "Action": "aps:*",
            "Resource": "${aws_prometheus_workspace.prometheus.arn}"
        }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "grafana-attach" {


  role       = aws_iam_role.assume.name
  policy_arn = aws_iam_policy.grafana.arn
}

# resource "aws_grafana_role_association" "abdullah" {
#   


# }

resource "grafana_data_source" "prometheus" {


  provider = grafana

  type = "prometheus"
  name = "amp"
  url  = aws_prometheus_workspace.prometheus.prometheus_endpoint
  json_data {
    http_method     = "POST"
    sigv4_auth      = true
    sigv4_auth_type = "default"
    sigv4_region    = "us-west-2"
  }
}

resource "aws_grafana_workspace_api_key" "key" {


  key_name        = "test-key"
  key_role        = "ADMIN"
  seconds_to_live = 2592000
  workspace_id    = aws_grafana_workspace.grafana.id
}

output "grafana_api_key" {
  value = aws_grafana_workspace_api_key.key.key
}

output "grafana_endpoint" {
  value = aws_grafana_workspace.grafana.endpoint
}
