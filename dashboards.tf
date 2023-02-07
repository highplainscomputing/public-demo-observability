data "template_file" "eks_dashboard" {
  template = file("${path.module}/files/kubernetes_cluster.json.tpl")

  vars = {
    grafana_datasource_type    = grafana_data_source.prometheus.type
    grafana_datasource_uid     = grafana_data_source.prometheus.uid
  }
}


resource "grafana_dashboard" "kubernetes" {
  provider = grafana
  config_json = data.template_file.eks_dashboard.rendered
}

data "template_file" "kubernetes_views_global" {
  template = file("${path.module}/files/kubernetes_views_global.json.tpl")

  vars = {
    grafana_datasource_type    = grafana_data_source.prometheus.type
    grafana_datasource_uid     = grafana_data_source.prometheus.uid
  }
}

resource "grafana_dashboard" "kubernetes_views_global" {
  provider = grafana
  config_json = data.template_file.kubernetes_views_global.rendered
}

data "template_file" "kubernetes_views_namespaces" {
  template = file("${path.module}/files/kubernetes_views_namespaces.json.tpl")

  vars = {
    grafana_datasource_type    = grafana_data_source.prometheus.type
    grafana_datasource_uid     = grafana_data_source.prometheus.uid
  }
}

resource "grafana_dashboard" "kubernetes_views_namespaces" {
  provider = grafana
  config_json = data.template_file.kubernetes_views_namespaces.rendered
}

data "template_file" "kubernetes_views_pods" {
  template = file("${path.module}/files/kubernetes_views_pods.json.tpl")

  vars = {
    grafana_datasource_type    = grafana_data_source.prometheus.type
    grafana_datasource_uid     = grafana_data_source.prometheus.uid
  }
}

resource "grafana_dashboard" "kubernetes_views_pods" {
  provider = grafana
  config_json = data.template_file.kubernetes_views_pods.rendered
}

data "template_file" "prometheus_overview" {
  template = file("${path.module}/files/prometheus_overview.json.tpl")

  vars = {
    grafana_datasource_type    = grafana_data_source.prometheus.type
    grafana_datasource_uid     = grafana_data_source.prometheus.uid
  }
}

resource "grafana_dashboard" "prometheus_overview" {
  provider = grafana
  config_json = data.template_file.prometheus_overview.rendered
}

data "template_file" "kubernetes_views_nodes" {
  template = file("${path.module}/files/kubernetes_views_nodes.json.tpl")

  vars = {
    grafana_datasource_type    = grafana_data_source.prometheus.type
    grafana_datasource_uid     = grafana_data_source.prometheus.uid
  }
}

resource "grafana_dashboard" "kubernetes_views_nodes" {
  provider = grafana
  config_json = data.template_file.kubernetes_views_nodes.rendered
}

# data "template_file" "node_exporter_nodes" {
#   template = file("${path.module}/files/node_exporter_nodes.json.tpl")

#   vars = {
#     grafana_datasource_type    = grafana_data_source.prometheus.type
#     grafana_datasource_uid     = grafana_data_source.prometheus.uid
#   }
# }

# resource "grafana_dashboard" "node_exporter_nodes" {
#   provider = grafana
#   config_json = data.template_file.node_exporter_nodes.rendered
# }

# data "template_file" "node_exporter_use_method_cluster" {
#   template = file("${path.module}/files/node_exporter_use_method_cluster.json.tpl")

#   vars = {
#     grafana_datasource_type    = grafana_data_source.prometheus.type
#     grafana_datasource_uid     = grafana_data_source.prometheus.uid
#   }
# }

# resource "grafana_dashboard" "node_exporter_use_method_cluster" {
#   provider = grafana
#   config_json = data.template_file.node_exporter_use_method_cluster.rendered
# }

# data "template_file" "node_exporter_use_method_node" {
#   template = file("${path.module}/files/node_exporter_use_method_node.json.tpl")

#   vars = {
#     grafana_datasource_type    = grafana_data_source.prometheus.type
#     grafana_datasource_uid     = grafana_data_source.prometheus.uid
#   }
# }

# resource "grafana_dashboard" "node_exporter_use_method_node" {
#   provider = grafana
#   config_json = data.template_file.node_exporter_use_method_node.rendered
# }