variable "region" {
  type    = string
  default = "us-west-2"
}
variable "name" {
  type        = string
  default     = "eks-observability"
  
}

variable "aws_auth_users" {
  type = list(any)
  default = []
}

variable "aws_auth_roles" {
  type = list(any)
  default = []
}

# -------------------------------------------------------------------------

variable "sns_topic_name" {
  type = string
  default = "prometheus-alert"
}

variable "sns_email" {
  type = string
  default = "abdullah.mustaqeem@highplains.io"
}

# -------------------------------------------------------------------------

# variable "AWS_ACCOUNT_ID" {
#   type = string
#   default = "841308375272"
# }

variable "PROM_SERVICE_ACCOUNT_NAMESPACE" {
  type = string
  default = "prometheus"
}

variable "SERVICE_ACCOUNT_NAME" {
  type = string
  default = "iamproxy-service-account"
}

variable "SERVICE_ACCOUNT_IAM_ROLE" {
  type = string
  default = "EKS-AMP-ServiceAccount-Role"
}

variable "SERVICE_ACCOUNT_IAM_POLICY" {
  type = string
  default = "AWSManagedPrometheusWriteAccessPolicy"
}

# -------------------------------------------------------------------------

variable "FLUENT_BIT_SERVICE_ACCOUNT_NAMESPACE" {
  type = string
  default = "logging"
}

variable "FLUENT_BIT_SERVICE_ACCOUNT_NAME" {
  type = string
  default = "fluent-bit"
}

variable "FLUENT_BIT_SERVICE_ACCOUNT_IAM_ROLE" {
  type = string
  default = "EKS-Fluentbit-ServiceAccount-Role"
}

variable "FLUENT_BIT_SERVICE_ACCOUNT_IAM_POLICY" {
  type = string
  default = "FleuntbitOpenSearchWrite"
}

variable "domain_name" {
  type = string
  default = "eks-logging"
}