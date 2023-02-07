{
  "annotations": {
    "list": [
      {
        "builtIn": 1,
        "datasource": {
          "type": "datasource",
          "uid": "grafana"
        },
        "enable": true,
        "hide": true,
        "iconColor": "rgba(0, 211, 255, 1)",
        "name": "Annotations & Alerts",
        "target": {
          "limit": 100,
          "matchAny": false,
          "tags": [],
          "type": "dashboard"
        },
        "type": "dashboard"
      }
    ]
  },
  "description": "This is a modern 'Global View' dashboard for your Kubernetes cluster(s). Made for kube-prometheus-stack and take advantage of the latest Grafana features. GitHub repository: https://github.com/dotdc/grafana-dashboards-kubernetes",
  "editable": true,
  "fiscalYearStartMonth": 0,
  "gnetId": 15757,
  "graphTooltip": 1,
  "id": 11,
  "iteration": 1667404198835,
  "links": [],
  "liveNow": false,
  "panels": [
    {
      "collapsed": false,
      "datasource": {
        "type": "${grafana_datasource_type}",
        "uid": "prometheus"
      },
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 0
      },
      "id": 67,
      "panels": [],
      "title": "Overview",
      "type": "row"
    },
    {
      "datasource": {
        "type": "${grafana_datasource_type}",
        "uid": "${grafana_datasource_uid}"
      },
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "continuous-GrYlRd"
          },
          "mappings": [],
          "max": 1,
          "min": 0,
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green",
                "value": null
              },
              {
                "color": "red",
                "value": 80
              }
            ]
          },
          "unit": "percentunit"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 8,
        "w": 6,
        "x": 0,
        "y": 1
      },
      "id": 77,
      "options": {
        "displayMode": "lcd",
        "minVizHeight": 10,
        "minVizWidth": 0,
        "orientation": "horizontal",
        "reduceOptions": {
          "calcs": [
            "lastNotNull"
          ],
          "fields": "",
          "values": false
        },
        "showUnfilled": true
      },
      "pluginVersion": "8.4.7",
      "targets": [
        {
          "datasource": {
            "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "editorMode": "code",
          "exemplar": true,
          "expr": "avg(1-rate(node_cpu_seconds_total{mode=\"idle\"}[$__rate_interval]))",
          "interval": "",
          "legendFormat": "Real",
          "range": true,
          "refId": "A"
        },
        {
          "datasource": {
            "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "editorMode": "code",
          "expr": "sum(kube_pod_container_resource_requests{unit=\"core\"}) / sum(machine_cpu_cores)",
          "hide": false,
          "legendFormat": "Requests",
          "range": true,
          "refId": "B"
        },
        {
          "datasource": {
            "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "editorMode": "code",
          "expr": "sum(kube_pod_container_resource_limits{unit=\"core\"}) / sum(machine_cpu_cores)",
          "hide": false,
          "legendFormat": "Limits",
          "range": true,
          "refId": "C"
        }
      ],
      "title": "Global CPU  Usage",
      "type": "bargauge"
    },
    {
      "datasource": {
        "type": "${grafana_datasource_type}",
        "uid": "${grafana_datasource_uid}"
      },
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "continuous-GrYlRd"
          },
          "decimals": 2,
          "mappings": [],
          "max": 1,
          "min": 0,
          "thresholds": {
            "mode": "percentage",
            "steps": [
              {
                "color": "green",
                "value": null
              },
              {
                "color": "red",
                "value": 80
              }
            ]
          },
          "unit": "percentunit"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 8,
        "w": 6,
        "x": 6,
        "y": 1
      },
      "id": 78,
      "options": {
        "displayMode": "lcd",
        "minVizHeight": 10,
        "minVizWidth": 0,
        "orientation": "horizontal",
        "reduceOptions": {
          "calcs": [
            "lastNotNull"
          ],
          "fields": "",
          "values": false
        },
        "showUnfilled": true,
        "text": {}
      },
      "pluginVersion": "8.4.7",
      "targets": [
        {
          "datasource": {
            "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "editorMode": "code",
          "exemplar": true,
          "expr": "sum(node_memory_MemTotal_bytes - node_memory_MemAvailable_bytes) / sum(node_memory_MemTotal_bytes)",
          "interval": "",
          "legendFormat": "Real",
          "range": true,
          "refId": "A"
        },
        {
          "datasource": {
            "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "editorMode": "code",
          "expr": "sum(kube_pod_container_resource_requests{unit=\"byte\"}) / sum(machine_memory_bytes)",
          "hide": false,
          "legendFormat": "Requests",
          "range": true,
          "refId": "B"
        },
        {
          "datasource": {
            "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "editorMode": "code",
          "expr": "sum(kube_pod_container_resource_limits{unit=\"byte\"}) / sum(machine_memory_bytes)",
          "hide": false,
          "legendFormat": "Limits",
          "range": true,
          "refId": "C"
        }
      ],
      "title": "Global RAM Usage",
      "type": "bargauge"
    },
    {
      "datasource": {
        "type": "${grafana_datasource_type}",
        "uid": "${grafana_datasource_uid}"
      },
      "fieldConfig": {
        "defaults": {
          "mappings": [],
          "noValue": "0",
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "blue",
                "value": null
              }
            ]
          }
        },
        "overrides": []
      },
      "gridPos": {
        "h": 4,
        "w": 2,
        "x": 12,
        "y": 1
      },
      "id": 63,
      "options": {
        "colorMode": "value",
        "graphMode": "none",
        "justifyMode": "auto",
        "orientation": "auto",
        "reduceOptions": {
          "calcs": [
            "last"
          ],
          "fields": "",
          "values": false
        },
        "text": {},
        "textMode": "value"
      },
      "pluginVersion": "8.4.7",
      "targets": [
        {
          "datasource": {
            "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "exemplar": true,
          "expr": "count(up{job=\"node-exporter\"})",
          "interval": "",
          "legendFormat": "",
          "refId": "A"
        }
      ],
      "title": "Nodes",
      "type": "stat"
    },
    {
      "datasource": {
        "type": "${grafana_datasource_type}",
        "uid": "${grafana_datasource_uid}"
      },
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "palette-classic"
          },
          "custom": {
            "axisLabel": "NB",
            "axisPlacement": "auto",
            "barAlignment": 0,
            "drawStyle": "line",
            "fillOpacity": 25,
            "gradientMode": "opacity",
            "hideFrom": {
              "legend": false,
              "tooltip": false,
              "viz": false
            },
            "lineInterpolation": "smooth",
            "lineWidth": 2,
            "pointSize": 5,
            "scaleDistribution": {
              "type": "linear"
            },
            "showPoints": "never",
            "spanNulls": true,
            "stacking": {
              "group": "A",
              "mode": "none"
            },
            "thresholdsStyle": {
              "mode": "off"
            }
          },
          "mappings": [],
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green",
                "value": null
              },
              {
                "color": "red",
                "value": 80
              }
            ]
          },
          "unit": "short"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 12,
        "w": 10,
        "x": 14,
        "y": 1
      },
      "id": 52,
      "options": {
        "legend": {
          "calcs": [
            "min",
            "max",
            "mean"
          ],
          "displayMode": "table",
          "placement": "right"
        },
        "tooltip": {
          "mode": "multi",
          "sort": "none"
        }
      },
      "pluginVersion": "8.3.3",
      "targets": [
        {
          "datasource": {
            "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "exemplar": true,
          "expr": "sum(kube_namespace_labels)",
          "interval": "",
          "legendFormat": "Namespaces",
          "refId": "A"
        },
        {
          "datasource": {
            "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "expr": "sum(kube_pod_container_status_running)",
          "interval": "",
          "legendFormat": "Running Containers",
          "refId": "B"
        },
        {
          "datasource": {
            "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "expr": "sum(kube_pod_status_phase{phase='Running'})",
          "interval": "",
          "legendFormat": "Running Pods",
          "refId": "O"
        },
        {
          "datasource": {
            "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "expr": "sum(kube_service_info)",
          "interval": "",
          "legendFormat": "Services",
          "refId": "C"
        },
        {
          "datasource": {
            "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "expr": "sum(kube_endpoint_info)",
          "interval": "",
          "legendFormat": "Endpoints",
          "refId": "D"
        },
        {
          "datasource": {
            "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "expr": "sum(kube_ingress_info)",
          "interval": "",
          "legendFormat": "Ingresses",
          "refId": "E"
        },
        {
          "datasource": {
            "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "expr": "sum(kube_deployment_labels)",
          "interval": "",
          "legendFormat": "Deployments",
          "refId": "F"
        },
        {
          "datasource": {
            "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "expr": "sum(kube_statefulset_labels)",
          "interval": "",
          "legendFormat": "Statefulsets",
          "refId": "G"
        },
        {
          "datasource": {
            "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "expr": "sum(kube_daemonset_labels)",
          "interval": "",
          "legendFormat": "Daemonsets",
          "refId": "H"
        },
        {
          "datasource": {
            "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "expr": "sum(kube_persistentvolumeclaim_info)",
          "interval": "",
          "legendFormat": "Persistent Volume Claims",
          "refId": "I"
        },
        {
          "datasource": {
            "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "expr": "sum(kube_hpa_labels)",
          "interval": "",
          "legendFormat": "Horizontal Pod Autoscalers",
          "refId": "J"
        },
        {
          "datasource": {
            "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "expr": "sum(kube_configmap_info)",
          "interval": "",
          "legendFormat": "Configmaps",
          "refId": "K"
        },
        {
          "datasource": {
            "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "expr": "sum(kube_secret_info)",
          "interval": "",
          "legendFormat": "Secrets",
          "refId": "L"
        },
        {
          "datasource": {
            "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "expr": "sum(kube_networkpolicy_labels)",
          "interval": "",
          "legendFormat": "Network Policies",
          "refId": "M"
        },
        {
          "datasource": {
            "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "exemplar": true,
          "expr": "count(up{job=\"node-exporter\"})",
          "hide": false,
          "interval": "",
          "legendFormat": "Nodes",
          "refId": "N"
        }
      ],
      "title": "Kubernetes Resource Count",
      "type": "timeseries"
    },
    {
      "datasource": {
        "type": "${grafana_datasource_type}",
        "uid": "${grafana_datasource_uid}"
      },
      "fieldConfig": {
        "defaults": {
          "mappings": [],
          "noValue": "0",
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "blue",
                "value": null
              }
            ]
          }
        },
        "overrides": []
      },
      "gridPos": {
        "h": 4,
        "w": 2,
        "x": 12,
        "y": 5
      },
      "id": 59,
      "options": {
        "colorMode": "value",
        "graphMode": "none",
        "justifyMode": "auto",
        "orientation": "auto",
        "reduceOptions": {
          "calcs": [
            "last"
          ],
          "fields": "",
          "values": false
        },
        "text": {},
        "textMode": "value"
      },
      "pluginVersion": "8.4.7",
      "targets": [
        {
          "datasource": {
            "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "expr": "count(kube_namespace_created)",
          "interval": "",
          "legendFormat": "",
          "refId": "A"
        }
      ],
      "title": "Namespaces",
      "type": "stat"
    },
    {
      "datasource": {
        "type": "${grafana_datasource_type}",
        "uid": "${grafana_datasource_uid}"
      },
      "fieldConfig": {
        "defaults": {
          "mappings": [],
          "noValue": "0",
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "rgb(255, 255, 255)",
                "value": null
              }
            ]
          },
          "unit": "none"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 4,
        "w": 6,
        "x": 0,
        "y": 9
      },
      "id": 37,
      "options": {
        "colorMode": "none",
        "graphMode": "none",
        "justifyMode": "center",
        "orientation": "auto",
        "reduceOptions": {
          "calcs": [
            "mean"
          ],
          "fields": "",
          "values": false
        },
        "text": {},
        "textMode": "auto"
      },
      "pluginVersion": "8.4.7",
      "targets": [
        {
          "datasource": {
            "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "editorMode": "code",
          "exemplar": true,
          "expr": "sum(1-rate(node_cpu_seconds_total{mode=\"idle\"}[$__rate_interval]))",
          "interval": "",
          "legendFormat": "Real",
          "range": true,
          "refId": "A"
        },
        {
          "datasource": {
            "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "editorMode": "code",
          "expr": "sum(kube_pod_container_resource_requests{unit=\"core\"})",
          "hide": false,
          "legendFormat": "Requests",
          "range": true,
          "refId": "B"
        },
        {
          "datasource": {
            "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "editorMode": "code",
          "expr": "sum(kube_pod_container_resource_limits{unit=\"core\"})",
          "hide": false,
          "legendFormat": "Limits",
          "range": true,
          "refId": "C"
        },
        {
          "datasource": {
            "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "editorMode": "code",
          "expr": "sum(machine_cpu_cores)",
          "hide": false,
          "legendFormat": "Total",
          "range": true,
          "refId": "D"
        }
      ],
      "title": "CPU Usage",
      "type": "stat"
    },
    {
      "datasource": {
        "type": "${grafana_datasource_type}",
        "uid": "${grafana_datasource_uid}"
      },
      "fieldConfig": {
        "defaults": {
          "mappings": [],
          "noValue": "0",
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "rgb(255, 255, 255)",
                "value": null
              }
            ]
          },
          "unit": "bytes"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 4,
        "w": 6,
        "x": 6,
        "y": 9
      },
      "id": 39,
      "options": {
        "colorMode": "none",
        "graphMode": "none",
        "justifyMode": "auto",
        "orientation": "auto",
        "reduceOptions": {
          "calcs": [
            "mean"
          ],
          "fields": "",
          "values": false
        },
        "text": {},
        "textMode": "auto"
      },
      "pluginVersion": "8.4.7",
      "targets": [
        {
          "datasource": {
            "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "editorMode": "code",
          "exemplar": true,
          "expr": "sum(node_memory_MemTotal_bytes - node_memory_MemAvailable_bytes)",
          "interval": "",
          "legendFormat": "Real",
          "range": true,
          "refId": "A"
        },
        {
          "datasource": {
            "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "editorMode": "code",
          "expr": "sum(kube_pod_container_resource_requests{unit=\"byte\"})",
          "hide": false,
          "legendFormat": "Requests",
          "range": true,
          "refId": "B"
        },
        {
          "datasource": {
            "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "editorMode": "code",
          "expr": "sum(kube_pod_container_resource_limits{unit=\"byte\"})",
          "hide": false,
          "legendFormat": "Limits",
          "range": true,
          "refId": "C"
        },
        {
          "datasource": {
            "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "editorMode": "code",
          "expr": "sum(machine_memory_bytes)",
          "hide": false,
          "legendFormat": "Total",
          "range": true,
          "refId": "D"
        }
      ],
      "title": "RAM Usage",
      "type": "stat"
    },
    {
      "datasource": {
        "type": "${grafana_datasource_type}",
        "uid": "${grafana_datasource_uid}"
      },
      "fieldConfig": {
        "defaults": {
          "mappings": [],
          "noValue": "0",
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "blue",
                "value": null
              }
            ]
          }
        },
        "overrides": []
      },
      "gridPos": {
        "h": 4,
        "w": 2,
        "x": 12,
        "y": 9
      },
      "id": 62,
      "options": {
        "colorMode": "value",
        "graphMode": "none",
        "justifyMode": "auto",
        "orientation": "auto",
        "reduceOptions": {
          "calcs": [
            "last"
          ],
          "fields": "",
          "values": false
        },
        "text": {},
        "textMode": "value"
      },
      "pluginVersion": "8.4.7",
      "targets": [
        {
          "datasource": {
            "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "expr": "sum(kube_pod_status_phase{phase='Running'})",
          "interval": "",
          "legendFormat": "",
          "refId": "A"
        }
      ],
      "title": "Running Pods",
      "type": "stat"
    },
    {
      "collapsed": false,
      "datasource": {
        "type": "${grafana_datasource_type}",
        "uid": "prometheus"
      },
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 13
      },
      "id": 71,
      "panels": [],
      "title": "Resources",
      "type": "row"
    },
    {
      "datasource": {
        "type": "${grafana_datasource_type}",
        "uid": "${grafana_datasource_uid}"
      },
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "continuous-GrYlRd",
            "seriesBy": "last"
          },
          "custom": {
            "axisLabel": "CPU %",
            "axisPlacement": "auto",
            "barAlignment": 0,
            "drawStyle": "line",
            "fillOpacity": 10,
            "gradientMode": "scheme",
            "hideFrom": {
              "legend": false,
              "tooltip": false,
              "viz": false
            },
            "lineInterpolation": "smooth",
            "lineStyle": {
              "fill": "solid"
            },
            "lineWidth": 2,
            "pointSize": 5,
            "scaleDistribution": {
              "type": "linear"
            },
            "showPoints": "never",
            "spanNulls": true,
            "stacking": {
              "group": "A",
              "mode": "none"
            },
            "thresholdsStyle": {
              "mode": "off"
            }
          },
          "decimals": 2,
          "mappings": [],
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green",
                "value": null
              },
              {
                "color": "yellow",
                "value": 0.5
              },
              {
                "color": "red",
                "value": 0.7
              }
            ]
          },
          "unit": "percentunit"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 8,
        "w": 12,
        "x": 0,
        "y": 14
      },
      "id": 72,
      "options": {
        "legend": {
          "calcs": [],
          "displayMode": "hidden",
          "placement": "right"
        },
        "tooltip": {
          "mode": "single",
          "sort": "none"
        }
      },
      "pluginVersion": "8.3.3",
      "targets": [
        {
          "datasource": {
            "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "exemplar": true,
          "expr": "avg(1-rate(node_cpu_seconds_total{mode=\"idle\"}[$__rate_interval]))",
          "interval": "$resolution",
          "legendFormat": "CPU usage in %",
          "refId": "A"
        }
      ],
      "title": "Cluster CPU Utilization",
      "type": "timeseries"
    },
    {
      "datasource": {
        "type": "${grafana_datasource_type}",
        "uid": "${grafana_datasource_uid}"
      },
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "continuous-GrYlRd"
          },
          "custom": {
            "axisLabel": "MEMORY",
            "axisPlacement": "auto",
            "barAlignment": 0,
            "drawStyle": "line",
            "fillOpacity": 10,
            "gradientMode": "scheme",
            "hideFrom": {
              "legend": false,
              "tooltip": false,
              "viz": false
            },
            "lineInterpolation": "smooth",
            "lineWidth": 2,
            "pointSize": 5,
            "scaleDistribution": {
              "type": "linear"
            },
            "showPoints": "never",
            "spanNulls": true,
            "stacking": {
              "group": "A",
              "mode": "none"
            },
            "thresholdsStyle": {
              "mode": "off"
            }
          },
          "mappings": [],
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green",
                "value": null
              },
              {
                "color": "#EAB839",
                "value": 0.5
              },
              {
                "color": "red",
                "value": 0.7
              }
            ]
          },
          "unit": "percentunit"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 8,
        "w": 12,
        "x": 12,
        "y": 14
      },
      "id": 55,
      "options": {
        "legend": {
          "calcs": [
            "mean",
            "lastNotNull",
            "max",
            "min"
          ],
          "displayMode": "hidden",
          "placement": "right"
        },
        "tooltip": {
          "mode": "single",
          "sort": "none"
        }
      },
      "pluginVersion": "8.3.3",
      "targets": [
        {
          "datasource": {
            "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "editorMode": "code",
          "exemplar": true,
          "expr": "sum(node_memory_MemTotal_bytes - node_memory_MemAvailable_bytes) / sum(node_memory_MemTotal_bytes)",
          "interval": "$resolution",
          "legendFormat": "Memory usage in %",
          "range": true,
          "refId": "A"
        }
      ],
      "title": "Cluster Memory Utilization",
      "type": "timeseries"
    },
    {
      "datasource": {
        "type": "${grafana_datasource_type}",
        "uid": "${grafana_datasource_uid}"
      },
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "palette-classic"
          },
          "custom": {
            "axisLabel": "CPU Cores",
            "axisPlacement": "auto",
            "barAlignment": 0,
            "drawStyle": "line",
            "fillOpacity": 25,
            "gradientMode": "opacity",
            "hideFrom": {
              "legend": false,
              "tooltip": false,
              "viz": false
            },
            "lineInterpolation": "smooth",
            "lineStyle": {
              "fill": "solid"
            },
            "lineWidth": 2,
            "pointSize": 5,
            "scaleDistribution": {
              "type": "linear"
            },
            "showPoints": "never",
            "spanNulls": true,
            "stacking": {
              "group": "A",
              "mode": "none"
            },
            "thresholdsStyle": {
              "mode": "off"
            }
          },
          "decimals": 2,
          "mappings": [],
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green",
                "value": null
              },
              {
                "color": "red",
                "value": 80
              }
            ]
          },
          "unit": "none"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 8,
        "w": 12,
        "x": 0,
        "y": 22
      },
      "id": 46,
      "options": {
        "legend": {
          "calcs": [
            "min",
            "max",
            "mean"
          ],
          "displayMode": "table",
          "placement": "right",
          "sortBy": "Max",
          "sortDesc": true
        },
        "tooltip": {
          "mode": "single",
          "sort": "none"
        }
      },
      "pluginVersion": "8.3.3",
      "targets": [
        {
          "datasource": {
            "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "exemplar": true,
          "expr": "sum(rate(container_cpu_usage_seconds_total{image!=\"\"}[$__rate_interval])) by (namespace)",
          "interval": "$resolution",
          "legendFormat": "{{ namespace }}",
          "refId": "A"
        }
      ],
      "title": "CPU Utilization by namespace",
      "type": "timeseries"
    },
    {
      "datasource": {
        "type": "${grafana_datasource_type}",
        "uid": "${grafana_datasource_uid}"
      },
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "palette-classic"
          },
          "custom": {
            "axisLabel": "MEMORY",
            "axisPlacement": "auto",
            "barAlignment": 0,
            "drawStyle": "line",
            "fillOpacity": 25,
            "gradientMode": "opacity",
            "hideFrom": {
              "legend": false,
              "tooltip": false,
              "viz": false
            },
            "lineInterpolation": "smooth",
            "lineWidth": 2,
            "pointSize": 5,
            "scaleDistribution": {
              "type": "linear"
            },
            "showPoints": "never",
            "spanNulls": true,
            "stacking": {
              "group": "A",
              "mode": "none"
            },
            "thresholdsStyle": {
              "mode": "off"
            }
          },
          "mappings": [],
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green",
                "value": null
              },
              {
                "color": "red",
                "value": 80
              }
            ]
          },
          "unit": "bytes"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 8,
        "w": 12,
        "x": 12,
        "y": 22
      },
      "id": 50,
      "options": {
        "legend": {
          "calcs": [
            "min",
            "max",
            "mean"
          ],
          "displayMode": "table",
          "placement": "right",
          "sortBy": "Max",
          "sortDesc": true
        },
        "tooltip": {
          "mode": "single",
          "sort": "none"
        }
      },
      "pluginVersion": "8.3.3",
      "targets": [
        {
          "datasource": {
            "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "exemplar": true,
          "expr": "sum(container_memory_working_set_bytes{image!=\"\"}) by (namespace)",
          "interval": "$resolution",
          "legendFormat": "{{ namespace }}",
          "refId": "A"
        }
      ],
      "title": "Memory Utilization by namespace",
      "type": "timeseries"
    },
    {
      "datasource": {
        "type": "${grafana_datasource_type}",
        "uid": "${grafana_datasource_uid}"
      },
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "palette-classic"
          },
          "custom": {
            "axisLabel": "CPU %",
            "axisPlacement": "auto",
            "barAlignment": 0,
            "drawStyle": "line",
            "fillOpacity": 25,
            "gradientMode": "opacity",
            "hideFrom": {
              "legend": false,
              "tooltip": false,
              "viz": false
            },
            "lineInterpolation": "smooth",
            "lineWidth": 2,
            "pointSize": 5,
            "scaleDistribution": {
              "type": "linear"
            },
            "showPoints": "never",
            "spanNulls": true,
            "stacking": {
              "group": "A",
              "mode": "none"
            },
            "thresholdsStyle": {
              "mode": "off"
            }
          },
          "decimals": 2,
          "mappings": [],
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green",
                "value": null
              },
              {
                "color": "red",
                "value": 80
              }
            ]
          },
          "unit": "percentunit"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 8,
        "w": 12,
        "x": 0,
        "y": 30
      },
      "id": 54,
      "options": {
        "legend": {
          "calcs": [
            "min",
            "max",
            "mean"
          ],
          "displayMode": "table",
          "placement": "right",
          "sortBy": "Max",
          "sortDesc": true
        },
        "tooltip": {
          "mode": "single",
          "sort": "none"
        }
      },
      "pluginVersion": "8.3.3",
      "targets": [
        {
          "datasource": {
            "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "exemplar": true,
          "expr": "avg(1-rate(node_cpu_seconds_total{mode=\"idle\"}[$__rate_interval])) by (instance)",
          "interval": "$resolution",
          "legendFormat": "{{ node }}",
          "refId": "A"
        }
      ],
      "title": "CPU Utilization by node",
      "type": "timeseries"
    },
    {
      "datasource": {
        "type": "${grafana_datasource_type}",
        "uid": "${grafana_datasource_uid}"
      },
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "palette-classic"
          },
          "custom": {
            "axisLabel": "MEMORY",
            "axisPlacement": "auto",
            "barAlignment": 0,
            "drawStyle": "line",
            "fillOpacity": 25,
            "gradientMode": "opacity",
            "hideFrom": {
              "legend": false,
              "tooltip": false,
              "viz": false
            },
            "lineInterpolation": "smooth",
            "lineWidth": 2,
            "pointSize": 5,
            "scaleDistribution": {
              "type": "linear"
            },
            "showPoints": "never",
            "spanNulls": true,
            "stacking": {
              "group": "A",
              "mode": "none"
            },
            "thresholdsStyle": {
              "mode": "off"
            }
          },
          "mappings": [],
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green",
                "value": null
              },
              {
                "color": "red",
                "value": 80
              }
            ]
          },
          "unit": "bytes"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 8,
        "w": 12,
        "x": 12,
        "y": 30
      },
      "id": 73,
      "options": {
        "legend": {
          "calcs": [
            "min",
            "max",
            "mean"
          ],
          "displayMode": "table",
          "placement": "right",
          "sortBy": "Max",
          "sortDesc": true
        },
        "tooltip": {
          "mode": "single",
          "sort": "none"
        }
      },
      "pluginVersion": "8.3.3",
      "targets": [
        {
          "datasource": {
            "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "editorMode": "code",
          "exemplar": true,
          "expr": "sum(node_memory_MemTotal_bytes - node_memory_MemAvailable_bytes) by (instance)",
          "interval": "$resolution",
          "legendFormat": "{{ node}}",
          "range": true,
          "refId": "A"
        }
      ],
      "title": "Memory Utilization by node",
      "type": "timeseries"
    },
    {
      "collapsed": false,
      "datasource": {
        "type": "${grafana_datasource_type}",
        "uid": "prometheus"
      },
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 38
      },
      "id": 69,
      "panels": [],
      "title": "Network",
      "type": "row"
    },
    {
      "datasource": {
        "type": "${grafana_datasource_type}",
        "uid": "${grafana_datasource_uid}"
      },
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "palette-classic"
          },
          "custom": {
            "axisLabel": "BANDWIDTH",
            "axisPlacement": "auto",
            "barAlignment": 0,
            "drawStyle": "line",
            "fillOpacity": 25,
            "gradientMode": "opacity",
            "hideFrom": {
              "legend": false,
              "tooltip": false,
              "viz": false
            },
            "lineInterpolation": "smooth",
            "lineWidth": 2,
            "pointSize": 5,
            "scaleDistribution": {
              "type": "linear"
            },
            "showPoints": "never",
            "spanNulls": true,
            "stacking": {
              "group": "A",
              "mode": "none"
            },
            "thresholdsStyle": {
              "mode": "off"
            }
          },
          "mappings": [],
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green",
                "value": null
              },
              {
                "color": "red",
                "value": 80
              }
            ]
          },
          "unit": "bytes"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 8,
        "w": 12,
        "x": 0,
        "y": 39
      },
      "id": 44,
      "options": {
        "legend": {
          "calcs": [],
          "displayMode": "hidden",
          "placement": "bottom"
        },
        "tooltip": {
          "mode": "multi",
          "sort": "none"
        }
      },
      "pluginVersion": "8.3.3",
      "targets": [
        {
          "datasource": {
            "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "editorMode": "code",
          "exemplar": true,
          "expr": "sum(rate(container_network_receive_bytes_total[$__rate_interval]))",
          "interval": "$resolution",
          "legendFormat": "Total received bytes",
          "range": true,
          "refId": "A"
        },
        {
          "datasource": {
            "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "editorMode": "code",
          "exemplar": true,
          "expr": "- sum(rate(container_network_transmit_bytes_total[$__rate_interval]))",
          "interval": "$resolution",
          "legendFormat": "Total transmitted bytes",
          "range": true,
          "refId": "B"
        }
      ],
      "title": "Global Network Utilization",
      "type": "timeseries"
    },
    {
      "datasource": {
        "type": "${grafana_datasource_type}",
        "uid": "${grafana_datasource_uid}"
      },
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "palette-classic"
          },
          "custom": {
            "axisLabel": "DROPPED PACKETS",
            "axisPlacement": "auto",
            "barAlignment": 0,
            "drawStyle": "line",
            "fillOpacity": 25,
            "gradientMode": "opacity",
            "hideFrom": {
              "legend": false,
              "tooltip": false,
              "viz": false
            },
            "lineInterpolation": "smooth",
            "lineWidth": 2,
            "pointSize": 5,
            "scaleDistribution": {
              "type": "linear"
            },
            "showPoints": "never",
            "spanNulls": true,
            "stacking": {
              "group": "A",
              "mode": "none"
            },
            "thresholdsStyle": {
              "mode": "off"
            }
          },
          "mappings": [],
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green",
                "value": null
              },
              {
                "color": "red",
                "value": 80
              }
            ]
          },
          "unit": "none"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 8,
        "w": 12,
        "x": 12,
        "y": 39
      },
      "id": 53,
      "options": {
        "legend": {
          "calcs": [],
          "displayMode": "hidden",
          "placement": "bottom"
        },
        "tooltip": {
          "mode": "multi",
          "sort": "none"
        }
      },
      "pluginVersion": "8.3.3",
      "targets": [
        {
          "datasource": {
            "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "editorMode": "code",
          "exemplar": true,
          "expr": "sum(rate(container_network_receive_packets_dropped_total[$__rate_interval]))",
          "interval": "$resolution",
          "legendFormat": "Packets dropped (receive)",
          "range": true,
          "refId": "A"
        },
        {
          "datasource": {
            "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "editorMode": "code",
          "exemplar": true,
          "expr": "- sum(rate(container_network_transmit_packets_dropped_total[$__rate_interval]))",
          "interval": "$resolution",
          "legendFormat": "Packets dropped (transmit)",
          "range": true,
          "refId": "B"
        }
      ],
      "title": "Network Saturation - Packets dropped",
      "type": "timeseries"
    },
    {
      "datasource": {
        "type": "${grafana_datasource_type}",
        "uid": "${grafana_datasource_uid}"
      },
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "palette-classic"
          },
          "custom": {
            "axisLabel": "BANDWIDTH",
            "axisPlacement": "auto",
            "barAlignment": 0,
            "drawStyle": "line",
            "fillOpacity": 25,
            "gradientMode": "opacity",
            "hideFrom": {
              "legend": false,
              "tooltip": false,
              "viz": false
            },
            "lineInterpolation": "smooth",
            "lineWidth": 2,
            "pointSize": 5,
            "scaleDistribution": {
              "type": "linear"
            },
            "showPoints": "never",
            "spanNulls": true,
            "stacking": {
              "group": "A",
              "mode": "none"
            },
            "thresholdsStyle": {
              "mode": "off"
            }
          },
          "mappings": [],
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green",
                "value": null
              },
              {
                "color": "red",
                "value": 80
              }
            ]
          },
          "unit": "bytes"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 8,
        "w": 12,
        "x": 0,
        "y": 47
      },
      "id": 79,
      "options": {
        "legend": {
          "calcs": [],
          "displayMode": "hidden",
          "placement": "bottom"
        },
        "tooltip": {
          "mode": "single",
          "sort": "none"
        }
      },
      "pluginVersion": "8.3.3",
      "targets": [
        {
          "datasource": {
            "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "editorMode": "code",
          "exemplar": true,
          "expr": "sum(rate(container_network_receive_bytes_total[$__rate_interval])) by (namespace)",
          "interval": "$resolution",
          "legendFormat": "Received bytes in {{ namespace }}",
          "range": true,
          "refId": "A"
        },
        {
          "datasource": {
            "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "editorMode": "code",
          "expr": "- sum(rate(container_network_transmit_bytes_total[$__rate_interval])) by (namespace)",
          "hide": false,
          "interval": "$resolution",
          "legendFormat": "Transmitted bytes in {{ namespace }}",
          "range": true,
          "refId": "B"
        }
      ],
      "title": "Network Received by namespace",
      "type": "timeseries"
    },
    {
      "datasource": {
        "type": "${grafana_datasource_type}",
        "uid": "${grafana_datasource_uid}"
      },
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "palette-classic"
          },
          "custom": {
            "axisLabel": "BANDWIDTH",
            "axisPlacement": "auto",
            "barAlignment": 0,
            "drawStyle": "line",
            "fillOpacity": 25,
            "gradientMode": "opacity",
            "hideFrom": {
              "legend": false,
              "tooltip": false,
              "viz": false
            },
            "lineInterpolation": "smooth",
            "lineWidth": 2,
            "pointSize": 5,
            "scaleDistribution": {
              "type": "linear"
            },
            "showPoints": "never",
            "spanNulls": true,
            "stacking": {
              "group": "A",
              "mode": "none"
            },
            "thresholdsStyle": {
              "mode": "off"
            }
          },
          "mappings": [],
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green",
                "value": null
              },
              {
                "color": "red",
                "value": 80
              }
            ]
          },
          "unit": "bytes"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 8,
        "w": 12,
        "x": 12,
        "y": 47
      },
      "id": 56,
      "options": {
        "legend": {
          "calcs": [],
          "displayMode": "hidden",
          "placement": "bottom"
        },
        "tooltip": {
          "mode": "single",
          "sort": "none"
        }
      },
      "pluginVersion": "8.3.3",
      "targets": [
        {
          "datasource": {
            "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "editorMode": "code",
          "exemplar": true,
          "expr": "sum(rate(container_network_receive_bytes_total[$__rate_interval])) by (node)",
          "interval": "$resolution",
          "legendFormat": "Received bytes in {{ node }}",
          "range": true,
          "refId": "A"
        },
        {
          "datasource": {
            "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "editorMode": "code",
          "expr": "- sum(rate(container_network_transmit_bytes_total[$__rate_interval])) by (node)",
          "hide": false,
          "interval": "$resolution",
          "legendFormat": "Transmitted bytes in {{ node }}",
          "range": true,
          "refId": "B"
        }
      ],
      "title": "Network Received by node",
      "type": "timeseries"
    }
  ],
  "refresh": "30s",
  "schemaVersion": 35,
  "style": "dark",
  "tags": [
    "Kubernetes",
    "Prometheus"
  ],
  "templating": {
    "list": [
      {
        "current": {
          "selected": false,
          "text": "amp",
          "value": "amp"
        },
        "hide": 0,
        "includeAll": false,
        "multi": false,
        "name": "datasource",
        "options": [],
        "query": "prometheus",
        "queryValue": "",
        "refresh": 1,
        "regex": "",
        "skipUrlSync": false,
        "type": "datasource"
      },
      {
        "current": {
          "selected": true,
          "text": "30s",
          "value": "30s"
        },
        "hide": 0,
        "includeAll": false,
        "multi": false,
        "name": "resolution",
        "options": [
          {
            "selected": false,
            "text": "1s",
            "value": "1s"
          },
          {
            "selected": false,
            "text": "15s",
            "value": "15s"
          },
          {
            "selected": true,
            "text": "30s",
            "value": "30s"
          },
          {
            "selected": false,
            "text": "1m",
            "value": "1m"
          },
          {
            "selected": false,
            "text": "3m",
            "value": "3m"
          },
          {
            "selected": false,
            "text": "5m",
            "value": "5m"
          }
        ],
        "query": "1s, 15s, 30s, 1m, 3m, 5m",
        "queryValue": "",
        "skipUrlSync": false,
        "type": "custom"
      }
    ]
  },
  "time": {
    "from": "now-1h",
    "to": "now"
  },
  "timepicker": {},
  "timezone": "",
  "title": "Kubernetes / Views / Global",
  "uid": "k8s_views_global",
  "version": 1,
  "weekStart": ""
}