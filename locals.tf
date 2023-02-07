locals {
  name            = var.name
  cluster_version = "1.22"
  region          = var.region
  # envs = ["k8sDev", "k8sAdmin"]

  tags = {
    name    = local.name
    region          = local.region
    purpose = "EKS security enhanced"
    created_by ="${data.aws_caller_identity.current.arn}"
    date_created = "${formatdate("YYYY-MMM-DD",timestamp())}"
    version = "0.0.1"
  }
}

