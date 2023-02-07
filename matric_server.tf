# Matric Server

data "kubectl_file_documents" "matric_server_docs" {
  content = file("matric_server.yaml")
}

resource "kubectl_manifest" "matric_server" {
  for_each  = data.kubectl_file_documents.matric_server_docs.manifests
  yaml_body = each.value

  depends_on = [module.eks]
}