resource "helm_release" "prometheus" {

  depends_on = [
    module.eks,
    aws_prometheus_workspace.prometheus,
    aws_iam_role.EKS_AMP_ServiceAccount_Role,
    aws_iam_policy.EKS-AMP-ServiceAccount-Role-Policy,
    aws_iam_role_policy_attachment.EKS-AMP-ServiceAccount-Role-Policy-Attach
  ]
  
  name = "prometheus"

  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "prometheus"
  namespace  = "prometheus"
  create_namespace = true

  values = [
   "${file("values_prometheus.yaml")}"
 ]

  set {
    name  = "serviceAccounts.server.name"
    value = var.SERVICE_ACCOUNT_NAME
  }
  set {
    name = "serviceAccounts.server.annotations.eks\\.amazonaws\\.com/role-arn"
    value = aws_iam_role.EKS_AMP_ServiceAccount_Role.arn
  }
  set {
    name  = "server.remoteWrite[0].url"
    value = "${aws_prometheus_workspace.prometheus.prometheus_endpoint}api/v1/remote_write"
  }
  set {
    name  = "server.remoteWrite[0].sigv4.region"
    value = var.region
  }
}