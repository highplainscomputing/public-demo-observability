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
  "description": "This is a modern 'Namespaces View' dashboard for your Kubernetes cluster(s). Made for kube-prometheus-stack and take advantage of the latest Grafana features. GitHub repository: https://github.com/dotdc/grafana-dashboards-kubernetes",
  "editable": true,
  "fiscalYearStartMonth": 0,
  "gnetId": 15758,
  "graphTooltip": 1,
  "id": 10,
  "iteration": 1667404511697,
  "links": [],
  "liveNow": false,
  "panels": [
    {
      "collapsed": false,
      "datasource": {
        "type": "datasource",
        "uid": "grafana"
      },
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 0
      },
      "id": 38,
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
                "color": "orange",
                "value": 50
              },
              {
                "color": "red",
                "value": 70
              }
            ]
          },
          "unit": "percentunit"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 7,
        "w": 6,
        "x": 0,
        "y": 1
      },
      "id": 46,
      "options": {
        "orientation": "auto",
        "reduceOptions": {
          "calcs": [
            "mean"
          ],
          "fields": "",
          "values": false
        },
        "showThresholdLabels": false,
        "showThresholdMarkers": true,
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
          "exemplar": false,
          "expr": "sum(rate(container_cpu_usage_seconds_total{namespace=~\"$namespace\", image!=\"\"}[$__rate_interval])) / sum(machine_cpu_cores)",
          "instant": true,
          "interval": "",
          "legendFormat": "",
          "range": false,
          "refId": "A"
        }
      ],
      "title": "Namespace(s) usage on total cluster CPU in %",
      "type": "gauge"
    },
    {
      "datasource": {
       "type": "${grafana_datasource_type}",
        "uid": "${grafana_datasource_uid}"
      },
      "fieldConfig": {
        "defaults": {
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
                "color": "orange",
                "value": 50
              },
              {
                "color": "red",
                "value": 70
              }
            ]
          },
          "unit": "percentunit"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 7,
        "w": 6,
        "x": 6,
        "y": 1
      },
      "id": 48,
      "options": {
        "orientation": "auto",
        "reduceOptions": {
          "calcs": [
            "lastNotNull"
          ],
          "fields": "",
          "values": false
        },
        "showThresholdLabels": false,
        "showThresholdMarkers": true,
        "text": {}
      },
      "pluginVersion": "8.4.7",
      "targets": [
        {
          "datasource": {
           "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "exemplar": true,
          "expr": "sum(container_memory_working_set_bytes{namespace=~\"$namespace\"}) / sum(machine_memory_bytes)",
          "interval": "",
          "legendFormat": "",
          "refId": "A"
        }
      ],
      "title": "Namespace(s) usage on total cluster RAM in %",
      "type": "gauge"
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
            "axisLabel": "",
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
        "h": 11,
        "w": 12,
        "x": 12,
        "y": 1
      },
      "id": 32,
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
          "mode": "multi",
          "sort": "desc"
        }
      },
      "pluginVersion": "8.3.3",
      "targets": [
        {
          "datasource": {
           "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "expr": "sum(kube_pod_container_status_running{namespace=~\"$namespace\"})",
          "interval": "",
          "legendFormat": "Running Pods",
          "refId": "A"
        },
        {
          "datasource": {
           "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "expr": "sum(kube_service_info{namespace=~\"$namespace\"})",
          "interval": "",
          "legendFormat": "Services",
          "refId": "B"
        },
        {
          "datasource": {
           "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "expr": "sum(kube_ingress_info{namespace=~\"$namespace\"})",
          "interval": "",
          "legendFormat": "Ingresses",
          "refId": "C"
        },
        {
          "datasource": {
           "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "expr": "sum(kube_deployment_labels{namespace=~\"$namespace\"})",
          "interval": "",
          "legendFormat": "Deployments",
          "refId": "D"
        },
        {
          "datasource": {
           "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "expr": "sum(kube_statefulset_labels{namespace=~\"$namespace\"})",
          "interval": "",
          "legendFormat": "Statefulsets",
          "refId": "E"
        },
        {
          "datasource": {
           "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "expr": "sum(kube_daemonset_labels{namespace=~\"$namespace\"})",
          "interval": "",
          "legendFormat": "Daemonsets",
          "refId": "F"
        },
        {
          "datasource": {
           "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "expr": "sum(kube_persistentvolumeclaim_info{namespace=~\"$namespace\"})",
          "interval": "",
          "legendFormat": "Persistent Volume Claims",
          "refId": "G"
        },
        {
          "datasource": {
           "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "expr": "sum(kube_hpa_labels{namespace=~\"$namespace\"})",
          "interval": "",
          "legendFormat": "Horizontal Pod Autoscalers",
          "refId": "H"
        },
        {
          "datasource": {
           "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "expr": "sum(kube_configmap_info{namespace=~\"$namespace\"})",
          "interval": "",
          "legendFormat": "Configmaps",
          "refId": "I"
        },
        {
          "datasource": {
           "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "expr": "sum(kube_secret_info{namespace=~\"$namespace\"})",
          "interval": "",
          "legendFormat": "Secrets",
          "refId": "J"
        },
        {
          "datasource": {
           "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "expr": "sum(kube_networkpolicy_labels{namespace=~\"$namespace\"})",
          "interval": "",
          "legendFormat": "Network Policies",
          "refId": "K"
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
        "y": 8
      },
      "id": 62,
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
          "expr": "sum(rate(container_cpu_usage_seconds_total{namespace=~\"$namespace\"}[$__rate_interval]))",
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
          "expr": "sum(kube_pod_container_resource_requests{namespace=~\"$namespace\", unit=\"core\"})",
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
          "expr": "sum(kube_pod_container_resource_limits{namespace=~\"$namespace\", unit=\"core\"})",
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
          "legendFormat": "Cluster Total",
          "range": true,
          "refId": "D"
        }
      ],
      "title": "Namespace(s) CPU Usage in cores",
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
        "y": 8
      },
      "id": 64,
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
          "expr": "sum(container_memory_working_set_bytes{namespace=~\"$namespace\"})",
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
          "expr": "sum(kube_pod_container_resource_requests{namespace=~\"$namespace\", unit=\"byte\"})",
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
          "expr": "sum(kube_pod_container_resource_limits{namespace=~\"$namespace\", unit=\"byte\"})",
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
          "legendFormat": "Cluster Total",
          "range": true,
          "refId": "D"
        }
      ],
      "title": "Namespace(s) RAM Usage in bytes",
      "type": "stat"
    },
    {
      "collapsed": false,
      "datasource": {
        "type": "datasource",
        "uid": "grafana"
      },
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 12
      },
      "id": 40,
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
        "x": 0,
        "y": 13
      },
      "id": 29,
      "options": {
        "legend": {
          "calcs": [],
          "displayMode": "table",
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
          "expr": "sum(rate(container_cpu_usage_seconds_total{namespace=~\"$namespace\", image!=\"\"}[$__rate_interval])) by (pod)",
          "interval": "$resolution",
          "legendFormat": "{{ pod }}",
          "refId": "A"
        }
      ],
      "title": "CPU usage by Pod",
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
            "axisLabel": "",
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
        "y": 13
      },
      "id": 30,
      "options": {
        "legend": {
          "calcs": [],
          "displayMode": "table",
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
          "expr": "sum(container_memory_working_set_bytes{namespace=~\"$namespace\", image!=\"\"}) by (pod)",
          "interval": "$resolution",
          "legendFormat": "{{ pod }}",
          "refId": "A"
        }
      ],
      "title": "Memory usage by Pod",
      "type": "timeseries"
    },
    {
      "collapsed": false,
      "datasource": {
        "type": "datasource",
        "uid": "grafana"
      },
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 21
      },
      "id": 44,
      "panels": [],
      "title": "Kubernetes Resources",
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
            "axisLabel": "",
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
          "decimals": 0,
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
      "id": 5,
      "options": {
        "legend": {
          "calcs": [],
          "displayMode": "hidden",
          "placement": "bottom"
        },
        "tooltip": {
          "mode": "multi",
          "sort": "desc"
        }
      },
      "pluginVersion": "8.3.3",
      "targets": [
        {
          "datasource": {
           "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "expr": "sum(kube_pod_container_status_ready{namespace=~\"$namespace\"})",
          "interval": "",
          "legendFormat": "Ready",
          "refId": "A"
        },
        {
          "datasource": {
           "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "expr": "sum(kube_pod_container_status_running{namespace=~\"$namespace\"})",
          "interval": "",
          "legendFormat": "Running",
          "refId": "B"
        },
        {
          "datasource": {
           "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "expr": "sum(kube_pod_container_status_waiting{namespace=~\"$namespace\"})",
          "interval": "",
          "legendFormat": "Waiting",
          "refId": "C"
        },
        {
          "datasource": {
           "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "expr": "sum(kube_pod_container_status_restarts_total{namespace=~\"$namespace\"})",
          "interval": "",
          "legendFormat": "Restarts Total",
          "refId": "D"
        },
        {
          "datasource": {
           "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "expr": "sum(kube_pod_container_status_terminated{namespace=~\"$namespace\"})",
          "interval": "",
          "legendFormat": "Terminated",
          "refId": "E"
        }
      ],
      "title": "Nb of pods by state",
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
            "axisLabel": "",
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
          "decimals": 0,
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
        "y": 22
      },
      "id": 2,
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
          "expr": "sum(kube_pod_container_info{namespace=~\"$namespace\"}) by (pod)",
          "interval": "",
          "legendFormat": "{{ pod }}",
          "refId": "A"
        }
      ],
      "title": "Nb of containers by pod",
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
            "axisLabel": "",
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
            "spanNulls": false,
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
        "h": 8,
        "w": 12,
        "x": 0,
        "y": 30
      },
      "id": 7,
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
          "exemplar": true,
          "expr": "sum(kube_deployment_status_replicas_available{namespace=~\"$namespace\"}) by (deployment)",
          "interval": "",
          "legendFormat": "{{ deployment }}",
          "refId": "A"
        }
      ],
      "title": "Replicas available by deployment",
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
            "axisLabel": "",
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
            "spanNulls": false,
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
        "h": 8,
        "w": 12,
        "x": 12,
        "y": 30
      },
      "id": 8,
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
          "expr": "sum(kube_deployment_status_replicas_unavailable{namespace=~\"$namespace\"}) by (deployment)",
          "interval": "",
          "legendFormat": "{{ deployment }}",
          "refId": "A"
        }
      ],
      "title": "Replicas unavailable by deployment",
      "type": "timeseries"
    },
    {
      "collapsed": false,
      "datasource": {
        "type": "datasource",
        "uid": "grafana"
      },
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 38
      },
      "id": 42,
      "panels": [],
      "title": "Kubernetes Storage",
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
            "axisLabel": "",
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
        "y": 39
      },
      "id": 12,
      "options": {
        "legend": {
          "calcs": [],
          "displayMode": "hidden",
          "placement": "bottom"
        },
        "tooltip": {
          "mode": "multi",
          "sort": "desc"
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
          "expr": "sum(kubelet_volume_stats_used_bytes{namespace=~\"$namespace\"}) by (persistentvolumeclaim) / sum(kubelet_volume_stats_capacity_bytes{namespace=~\"$namespace\"}) by (persistentvolumeclaim)",
          "interval": "",
          "legendFormat": "{{ persistentvolumeclaim }}",
          "refId": "A"
        }
      ],
      "title": "Persistent Volumes - Capacity",
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
            "axisLabel": "",
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
          "unit": "percent"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 8,
        "w": 12,
        "x": 12,
        "y": 39
      },
      "id": 27,
      "options": {
        "legend": {
          "calcs": [],
          "displayMode": "hidden",
          "placement": "bottom"
        },
        "tooltip": {
          "mode": "multi",
          "sort": "desc"
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
          "expr": "sum(kubelet_volume_stats_inodes_used{namespace=~\"$namespace\"}) by (persistentvolumeclaim) / sum(kubelet_volume_stats_inodes{namespace=~\"$namespace\"}) by (persistentvolumeclaim) * 100",
          "interval": "",
          "legendFormat": "{{ persistentvolumeclaim }}",
          "refId": "A"
        }
      ],
      "title": "Persistent Volumes - Inodes",
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
          "text": [
            "kube-system"
          ],
          "value": [
            "kube-system"
          ]
        },
        "datasource": {
         "type": "${grafana_datasource_type}",
          "uid": "${grafana_datasource_uid}"
        },
        "definition": "label_values(kube_pod_info, namespace)",
        "hide": 0,
        "includeAll": true,
        "multi": true,
        "name": "namespace",
        "options": [],
        "query": {
          "query": "label_values(kube_pod_info, namespace)",
          "refId": "StandardVariableQuery"
        },
        "refresh": 1,
        "regex": "",
        "skipUrlSync": false,
        "sort": 1,
        "tagValuesQuery": "",
        "tagsQuery": "",
        "type": "query",
        "useTags": false
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
  "title": "Kubernetes / Views / Namespaces",
  "uid": "k8s_views_ns",
  "version": 1,
  "weekStart": ""
}