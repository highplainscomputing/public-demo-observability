resource "kubernetes_namespace" "fluent-bit" {

  metadata {
   name = "fluent-bit"
  }
}

resource "helm_release" "fluent-bit" {

  depends_on = [
    kubernetes_namespace.fluent-bit,
    module.eks

  ]
  
  name = "fluent-bit"

  repository = "https://fluent.github.io/helm-charts"
  chart      = "fluent-bit"
  namespace  = "fluent-bit"
  version    = "0.20.2"

  values = [
   "${file("values_fluent_bit.yaml")}"
 ]

 set {
 
    name = "env[0].name"
    value = "Host"
 }

 set {
    name = "env[0].value"
    value = "${aws_opensearch_domain.eks_logging.endpoint}"
  }
}