{
  "annotations": {
    "list": [
      {
        "builtIn": 1,
        "datasource": {
          "type": "${grafana_datasource_type}",
          "uid": "${grafana_datasource_uid}"
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
  "description": "This is a modern 'Nodes View' dashboard for your Kubernetes cluster(s). Made for kube-prometheus-stack and take advantage of the latest Grafana features. GitHub repository: https://github.com/dotdc/grafana-dashboards-kubernetes",
  "editable": true,
  "fiscalYearStartMonth": 0,
  "gnetId": 15759,
  "graphTooltip": 1,
  "id": 12,
  "iteration": 1667477487034,
  "links": [],
  "liveNow": false,
  "panels": [
    {
      "collapsed": false,
      "datasource": {
        "type": "${grafana_datasource_type}",
        "uid": "${grafana_datasource_uid}"
      },
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 0
      },
      "id": 40,
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
        "h": 8,
        "w": 4,
        "x": 0,
        "y": 1
      },
      "id": 7,
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
          "exemplar": false,
          "expr": "avg(1-rate(node_cpu_seconds_total{mode=\"idle\", instance=\"$instance\"}[$__rate_interval]))",
          "instant": true,
          "interval": "$resolution",
          "legendFormat": "",
          "refId": "A"
        }
      ],
      "title": "CPU  Usage",
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
        "h": 8,
        "w": 4,
        "x": 4,
        "y": 1
      },
      "id": 13,
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
          "exemplar": false,
          "expr": "sum(node_memory_MemTotal_bytes{instance=\"$instance\"} - node_memory_MemAvailable_bytes{instance=\"$instance\"}) / sum(node_memory_MemTotal_bytes{instance=\"$instance\"})",
          "instant": true,
          "interval": "$resolution",
          "legendFormat": "",
          "refId": "A"
        }
      ],
      "title": "RAM Usage",
      "type": "gauge"
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
        "h": 8,
        "w": 4,
        "x": 8,
        "y": 1
      },
      "id": 24,
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
          "expr": "sum(kube_pod_info{node=\"$node\"})",
          "interval": "",
          "legendFormat": "",
          "refId": "A"
        }
      ],
      "title": "Pods on node",
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
            "mode": "thresholds"
          },
          "custom": {
            "align": "auto",
            "displayMode": "auto"
          },
          "links": [
            {
              "targetBlank": true,
              "title": "Pod details"
            }
          ],
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
          }
        },
        "overrides": [
          {
            "matcher": {
              "id": "byName",
              "options": "pod"
            },
            "properties": [
              {
                "id": "custom.width",
                "value": 416
              }
            ]
          },
          {
            "matcher": {
              "id": "byName",
              "options": "priority_class"
            },
            "properties": [
              {
                "id": "custom.width",
                "value": 176
              }
            ]
          },
          {
            "matcher": {
              "id": "byName",
              "options": "pod_ip"
            },
            "properties": [
              {
                "id": "custom.width",
                "value": 157
              }
            ]
          },
          {
            "matcher": {
              "id": "byName",
              "options": "created_by_kind"
            },
            "properties": [
              {
                "id": "custom.width",
                "value": 205
              }
            ]
          },
          {
            "matcher": {
              "id": "byName",
              "options": "namespace"
            },
            "properties": [
              {
                "id": "custom.width",
                "value": 263
              }
            ]
          }
        ]
      },
      "gridPos": {
        "h": 11,
        "w": 12,
        "x": 12,
        "y": 1
      },
      "id": 5,
      "options": {
        "footer": {
          "fields": "",
          "reducer": [
            "sum"
          ],
          "show": false
        },
        "showHeader": true,
        "sortBy": []
      },
      "pluginVersion": "8.4.7",
      "targets": [
        {
          "datasource": {
            "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "exemplar": true,
          "expr": "kube_pod_info{node=\"$node\"}",
          "format": "table",
          "interval": "",
          "legendFormat": "",
          "refId": "A"
        }
      ],
      "title": "List of pods on node ($node)",
      "transformations": [
        {
          "id": "organize",
          "options": {
            "excludeByName": {
              "Time": true,
              "Value": true,
              "__name__": true,
              "container": true,
              "created_by_kind": false,
              "created_by_name": true,
              "endpoint": true,
              "env": true,
              "host_ip": true,
              "host_network": true,
              "instance": true,
              "job": true,
              "node": true,
              "project": true,
              "prometheus_replica": true,
              "service": true,
              "uid": true
            },
            "indexByName": {
              "Time": 6,
              "Value": 20,
              "__name__": 7,
              "container": 8,
              "created_by_kind": 2,
              "created_by_name": 9,
              "endpoint": 10,
              "env": 11,
              "host_ip": 5,
              "host_network": 12,
              "instance": 13,
              "job": 14,
              "namespace": 1,
              "node": 15,
              "pod": 0,
              "pod_ip": 3,
              "priority_class": 4,
              "project": 16,
              "prometheus_replica": 17,
              "service": 18,
              "uid": 19
            },
            "renameByName": {}
          }
        },
        {
          "id": "groupBy",
          "options": {
            "fields": {
              "created_by_kind": {
                "aggregations": [],
                "operation": "groupby"
              },
              "host_ip": {
                "aggregations": [],
                "operation": "groupby"
              },
              "namespace": {
                "aggregations": [
                  "last"
                ],
                "operation": "groupby"
              },
              "pod": {
                "aggregations": [],
                "operation": "groupby"
              },
              "pod_ip": {
                "aggregations": [],
                "operation": "groupby"
              },
              "priority_class": {
                "aggregations": [],
                "operation": "groupby"
              }
            }
          }
        }
      ],
      "type": "table"
    },
    {
      "datasource": {
        "type": "${grafana_datasource_type}",
        "uid": "${grafana_datasource_uid}"
      },
      "fieldConfig": {
        "defaults": {
          "decimals": 3,
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
        "h": 3,
        "w": 2,
        "x": 0,
        "y": 9
      },
      "id": 9,
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
          "exemplar": false,
          "expr": "sum(1-rate(node_cpu_seconds_total{mode=\"idle\", instance=\"$instance\"}[$__rate_interval]))",
          "instant": true,
          "interval": "$resolution",
          "legendFormat": "",
          "refId": "A"
        }
      ],
      "title": "CPU Used",
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
        "h": 3,
        "w": 2,
        "x": 2,
        "y": 9
      },
      "id": 11,
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
          "exemplar": true,
          "expr": "sum(machine_cpu_cores{node=\"$node\"})",
          "interval": "$resolution",
          "legendFormat": "",
          "refId": "A"
        }
      ],
      "title": "CPU Total",
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
        "h": 3,
        "w": 2,
        "x": 4,
        "y": 9
      },
      "id": 15,
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
          "exemplar": false,
          "expr": "sum(node_memory_MemTotal_bytes{instance=\"$instance\"} - node_memory_MemAvailable_bytes{instance=\"$instance\"})",
          "instant": true,
          "interval": "",
          "legendFormat": "",
          "refId": "A"
        }
      ],
      "title": "RAM Used",
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
        "h": 3,
        "w": 2,
        "x": 6,
        "y": 9
      },
      "id": 17,
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
          "exemplar": true,
          "expr": "machine_memory_bytes{node=\"$node\"}",
          "instant": false,
          "interval": "",
          "legendFormat": "",
          "refId": "A"
        }
      ],
      "title": "RAM Total",
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
                "color": "green",
                "value": null
              },
              {
                "color": "#EAB839",
                "value": 25228800
              },
              {
                "color": "red",
                "value": 31536000
              }
            ]
          },
          "unit": "s"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 3,
        "w": 4,
        "x": 8,
        "y": 9
      },
      "id": 18,
      "options": {
        "colorMode": "value",
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
          "exemplar": true,
          "expr": "node_time_seconds{instance=\"$instance\"} - node_boot_time_seconds{instance=\"$instance\"}",
          "instant": false,
          "interval": "",
          "legendFormat": "",
          "refId": "A"
        }
      ],
      "title": "uptime",
      "type": "stat"
    },
    {
      "collapsed": false,
      "datasource": {
        "type": "${grafana_datasource_type}",
        "uid": "${grafana_datasource_uid}"
      },
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 12
      },
      "id": 38,
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
            "lineStyle": {
              "fill": "solid"
            },
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
          "max": 100,
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
        "h": 9,
        "w": 12,
        "x": 0,
        "y": 13
      },
      "id": 2,
      "options": {
        "legend": {
          "calcs": [],
          "displayMode": "list",
          "placement": "bottom"
        },
        "tooltip": {
          "mode": "multi",
          "sort": "none"
        }
      },
      "targets": [
        {
          "datasource": {
            "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "exemplar": true,
          "expr": "avg(rate(node_cpu_seconds_total{instance=\"$instance\"}[$__rate_interval]) * 100) by (mode)",
          "hide": false,
          "instant": false,
          "interval": "$resolution",
          "legendFormat": "{{ mode }}",
          "refId": "A"
        }
      ],
      "title": "CPU Usage",
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
            "lineStyle": {
              "fill": "solid"
            },
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
          "unit": "bytes"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 9,
        "w": 12,
        "x": 12,
        "y": 13
      },
      "id": 3,
      "options": {
        "legend": {
          "calcs": [],
          "displayMode": "list",
          "placement": "right"
        },
        "tooltip": {
          "mode": "multi",
          "sort": "desc"
        }
      },
      "targets": [
        {
          "datasource": {
            "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "exemplar": true,
          "expr": "node_memory_MemTotal_bytes{instance=\"$instance\"} - node_memory_MemFree_bytes{instance=\"$instance\"} - (node_memory_Cached_bytes{instance=\"$instance\"} + node_memory_Buffers_bytes{instance=\"$instance\"})",
          "instant": false,
          "interval": "$resolution",
          "legendFormat": "RAM Used",
          "refId": "A"
        },
        {
          "datasource": {
            "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "exemplar": true,
          "expr": "node_memory_MemTotal_bytes{instance=\"$instance\"}",
          "hide": false,
          "interval": "$resolution",
          "legendFormat": "RAM Total",
          "refId": "B"
        },
        {
          "datasource": {
            "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "exemplar": true,
          "expr": "node_memory_Cached_bytes{instance=\"$instance\"}",
          "hide": false,
          "interval": "$resolution",
          "legendFormat": "RAM Cache",
          "refId": "C"
        },
        {
          "datasource": {
            "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "exemplar": true,
          "expr": "node_memory_Buffers_bytes{instance=\"$instance\"}",
          "hide": false,
          "interval": "$resolution",
          "legendFormat": "RAM Buffer",
          "refId": "D"
        },
        {
          "datasource": {
            "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "exemplar": true,
          "expr": "node_memory_MemFree_bytes{instance=\"$instance\"}",
          "hide": false,
          "interval": "$resolution",
          "legendFormat": "RAM Free",
          "refId": "E"
        },
        {
          "datasource": {
            "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "exemplar": true,
          "expr": "node_memory_SwapTotal_bytes{instance=\"$instance\"} - node_memory_SwapFree_bytes{instance=\"$instance\"}",
          "hide": false,
          "interval": "$resolution",
          "legendFormat": "SWAP Used",
          "refId": "F"
        },
        {
          "datasource": {
            "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "exemplar": true,
          "expr": "node_memory_SwapTotal_bytes{instance=\"$instance\"}",
          "hide": false,
          "interval": "$resolution",
          "legendFormat": "SWAP Total",
          "refId": "G"
        }
      ],
      "title": "Memory Usage",
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
        "y": 22
      },
      "id": 26,
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
          "expr": "sum(rate(container_cpu_usage_seconds_total{node=\"$node\", image!=\"\"}[$__rate_interval])) by (pod)",
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
        "y": 22
      },
      "id": 28,
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
          "expr": "sum(container_memory_working_set_bytes{node=\"$node\", image!=\"\"}) by (pod)",
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
        "type": "${grafana_datasource_type}",
        "uid": "${grafana_datasource_uid}"
      },
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 30
      },
      "id": 44,
      "panels": [],
      "title": "System",
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
            "lineStyle": {
              "fill": "solid"
            },
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
          }
        },
        "overrides": []
      },
      "gridPos": {
        "h": 8,
        "w": 12,
        "x": 0,
        "y": 31
      },
      "id": 48,
      "options": {
        "legend": {
          "calcs": [],
          "displayMode": "list",
          "placement": "bottom"
        },
        "tooltip": {
          "mode": "multi",
          "sort": "desc"
        }
      },
      "targets": [
        {
          "datasource": {
            "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "editorMode": "code",
          "exemplar": true,
          "expr": "node_load1{instance=\"$instance\"}",
          "interval": "$resolution",
          "legendFormat": "1m",
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
          "expr": "node_load5{instance=\"$instance\"}",
          "hide": false,
          "interval": "$resolution",
          "legendFormat": "5m",
          "range": true,
          "refId": "B"
        },
        {
          "datasource": {
            "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "editorMode": "code",
          "exemplar": true,
          "expr": "node_load15{instance=\"$instance\"}",
          "hide": false,
          "interval": "$resolution",
          "legendFormat": "15m",
          "range": true,
          "refId": "C"
        }
      ],
      "title": "System Load",
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
          }
        },
        "overrides": []
      },
      "gridPos": {
        "h": 8,
        "w": 12,
        "x": 12,
        "y": 31
      },
      "id": 46,
      "options": {
        "legend": {
          "calcs": [],
          "displayMode": "list",
          "placement": "bottom"
        },
        "tooltip": {
          "mode": "multi",
          "sort": "desc"
        }
      },
      "targets": [
        {
          "datasource": {
            "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "editorMode": "code",
          "exemplar": true,
          "expr": "rate(node_context_switches_total{instance=\"$instance\"}[$__rate_interval])",
          "interval": "$resolution",
          "intervalFactor": 1,
          "legendFormat": "Context switches",
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
          "expr": "rate(node_intr_total{instance=\"$instance\"}[$__rate_interval])",
          "hide": false,
          "interval": "$resolution",
          "legendFormat": "Interrupts",
          "range": true,
          "refId": "B"
        }
      ],
      "title": "Context Switches & Interrupts",
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
            "lineStyle": {
              "fill": "solid"
            },
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
          }
        },
        "overrides": []
      },
      "gridPos": {
        "h": 8,
        "w": 12,
        "x": 0,
        "y": 39
      },
      "id": 49,
      "options": {
        "legend": {
          "calcs": [],
          "displayMode": "list",
          "placement": "bottom"
        },
        "tooltip": {
          "mode": "multi",
          "sort": "none"
        }
      },
      "targets": [
        {
          "datasource": {
            "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "editorMode": "code",
          "exemplar": true,
          "expr": "node_filefd_maximum{instance=\"$instance\"}",
          "instant": false,
          "interval": "$resolution",
          "legendFormat": "Maximum file descriptors",
          "refId": "A"
        },
        {
          "datasource": {
            "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "editorMode": "code",
          "exemplar": true,
          "expr": "node_filefd_allocated{instance=\"$instance\"}",
          "hide": false,
          "instant": false,
          "interval": "$resolution",
          "legendFormat": "Allocated file descriptors",
          "refId": "B"
        }
      ],
      "title": "File Descriptors",
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
            "lineStyle": {
              "fill": "solid"
            },
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
          "unit": "s"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 8,
        "w": 12,
        "x": 12,
        "y": 39
      },
      "id": 50,
      "options": {
        "legend": {
          "calcs": [],
          "displayMode": "list",
          "placement": "bottom"
        },
        "tooltip": {
          "mode": "multi",
          "sort": "desc"
        }
      },
      "targets": [
        {
          "datasource": {
            "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "editorMode": "code",
          "exemplar": true,
          "expr": "node_timex_estimated_error_seconds{instance=\"$instance\"}",
          "instant": false,
          "interval": "$resolution",
          "intervalFactor": 1,
          "legendFormat": "Estimated error in seconds",
          "refId": "A"
        },
        {
          "datasource": {
            "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "editorMode": "code",
          "exemplar": true,
          "expr": "node_timex_maxerror_seconds{instance=\"$instance\"}",
          "hide": false,
          "interval": "$resolution",
          "intervalFactor": 1,
          "legendFormat": "Maximum error in seconds",
          "range": true,
          "refId": "B"
        }
      ],
      "title": "Time Sync",
      "type": "timeseries"
    },
    {
      "collapsed": false,
      "datasource": {
        "type": "${grafana_datasource_type}",
        "uid": "${grafana_datasource_uid}"
      },
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 47
      },
      "id": 36,
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
            "lineInterpolation": "linear",
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
        "y": 48
      },
      "id": 20,
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
          "expr": "sum(rate(node_network_receive_bytes_total{instance=\"$instance\"}[$__rate_interval]))",
          "interval": "$resolution",
          "legendFormat": "In",
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
          "expr": "- sum(rate(node_network_transmit_bytes_total{instance=\"$instance\"}[$__rate_interval]))",
          "interval": "$resolution",
          "legendFormat": "Out",
          "range": true,
          "refId": "B"
        }
      ],
      "title": "Network usage (bytes)",
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
          "unit": "none"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 8,
        "w": 12,
        "x": 12,
        "y": 48
      },
      "id": 61,
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
          "expr": "sum(rate(node_network_receive_errs_total{instance=\"$instance\"}[$__rate_interval]))",
          "interval": "$resolution",
          "legendFormat": "In",
          "refId": "A"
        },
        {
          "datasource": {
            "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "editorMode": "code",
          "exemplar": true,
          "expr": "- sum(rate(node_network_transmit_errs_total{instance=\"$instance\"}[$__rate_interval]))",
          "interval": "$resolution",
          "legendFormat": "Out",
          "range": true,
          "refId": "B"
        }
      ],
      "title": "Network errors",
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
          "unit": "pps"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 8,
        "w": 12,
        "x": 0,
        "y": 56
      },
      "id": 62,
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
          "expr": "sum(rate(node_network_receive_packets_total{instance=\"$instance\"}[$__rate_interval]))",
          "interval": "$resolution",
          "legendFormat": "In",
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
          "expr": "- sum(rate(node_network_transmit_packets_total{instance=\"$instance\"}[$__rate_interval]))",
          "interval": "$resolution",
          "legendFormat": "Out",
          "range": true,
          "refId": "B"
        }
      ],
      "title": "Network usage (packet/s)",
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
          "unit": "none"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 8,
        "w": 12,
        "x": 12,
        "y": 56
      },
      "id": 64,
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
          "expr": "sum(rate(node_network_receive_drop_total{instance=\"$instance\"}[$__rate_interval]))",
          "hide": false,
          "interval": "$resolution",
          "legendFormat": "In",
          "refId": "A"
        },
        {
          "datasource": {
            "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "exemplar": true,
          "expr": "- sum(rate(node_network_transmit_drop_total{instance=\"$instance\"}[$__rate_interval]))",
          "hide": false,
          "interval": "$resolution",
          "legendFormat": "Out",
          "refId": "B"
        }
      ],
      "title": "Network total drops",
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
          "unit": "none"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 8,
        "w": 12,
        "x": 0,
        "y": 64
      },
      "id": 60,
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
          "expr": "node_netstat_Tcp_CurrEstab{instance=\"$instance\"}",
          "instant": false,
          "interval": "$resolution",
          "legendFormat": "TCP Currently Established",
          "refId": "A"
        }
      ],
      "title": "TCP Currently Established",
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
          "unit": "none"
        },
        "overrides": [
          {
            "matcher": {
              "id": "byName",
              "options": "NF Conntrack limit"
            },
            "properties": [
              {
                "id": "color",
                "value": {
                  "fixedColor": "red",
                  "mode": "fixed"
                }
              }
            ]
          }
        ]
      },
      "gridPos": {
        "h": 8,
        "w": 12,
        "x": 12,
        "y": 64
      },
      "id": 63,
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
          "expr": "node_nf_conntrack_entries{instance=\"$instance\"}",
          "instant": false,
          "interval": "$resolution",
          "legendFormat": "NF Conntrack entries",
          "refId": "A"
        },
        {
          "datasource": {
            "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "editorMode": "code",
          "exemplar": true,
          "expr": "node_nf_conntrack_entries_limit{instance=\"$instance\"}",
          "hide": false,
          "interval": "$resolution",
          "legendFormat": "NF Conntrack limit",
          "range": true,
          "refId": "B"
        }
      ],
      "title": "NF Conntrack",
      "type": "timeseries"
    },
    {
      "collapsed": false,
      "datasource": {
        "type": "${grafana_datasource_type}",
        "uid": "${grafana_datasource_uid}"
      },
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 72
      },
      "id": 54,
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
        "y": 73
      },
      "id": 30,
      "options": {
        "legend": {
          "calcs": [],
          "displayMode": "hidden",
          "placement": "right"
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
          "editorMode": "code",
          "exemplar": true,
          "expr": "sum(kubelet_volume_stats_used_bytes{node=\"$node\"}) by (persistentvolumeclaim) / sum(kubelet_volume_stats_capacity_bytes{node=\"$node\"}) by (persistentvolumeclaim)",
          "interval": "$resolution",
          "legendFormat": "{{ persistentvolumeclaim }}",
          "range": true,
          "refId": "A"
        }
      ],
      "title": "Persistent Volumes - Usage in %",
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
            "align": "auto",
            "displayMode": "auto",
            "filterable": false
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
        "overrides": [
          {
            "matcher": {
              "id": "byName",
              "options": "Used"
            },
            "properties": [
              {
                "id": "custom.width",
                "value": 146
              }
            ]
          },
          {
            "matcher": {
              "id": "byName",
              "options": "Total"
            },
            "properties": [
              {
                "id": "custom.width",
                "value": 167
              }
            ]
          }
        ]
      },
      "gridPos": {
        "h": 16,
        "w": 12,
        "x": 12,
        "y": 73
      },
      "id": 34,
      "options": {
        "footer": {
          "fields": "",
          "reducer": [
            "sum"
          ],
          "show": false
        },
        "showHeader": true,
        "sortBy": []
      },
      "pluginVersion": "8.4.7",
      "targets": [
        {
          "datasource": {
            "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "exemplar": true,
          "expr": "sum(kubelet_volume_stats_used_bytes{node=\"$node\"}) by (persistentvolumeclaim)",
          "format": "table",
          "hide": false,
          "interval": "",
          "legendFormat": "",
          "refId": "A"
        },
        {
          "datasource": {
            "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "exemplar": true,
          "expr": "sum(kubelet_volume_stats_capacity_bytes{node=\"$node\"}) by (persistentvolumeclaim) ",
          "format": "table",
          "hide": false,
          "interval": "",
          "legendFormat": "",
          "refId": "B"
        }
      ],
      "title": "Persistent Volumes - Usage in GB",
      "transformations": [
        {
          "id": "groupBy",
          "options": {
            "fields": {
              "Value": {
                "aggregations": [
                  "lastNotNull"
                ],
                "operation": "aggregate"
              },
              "Value #A": {
                "aggregations": [
                  "lastNotNull"
                ],
                "operation": "aggregate"
              },
              "Value #B": {
                "aggregations": [
                  "lastNotNull"
                ],
                "operation": "aggregate"
              },
              "persistentvolumeclaim": {
                "aggregations": [],
                "operation": "groupby"
              }
            }
          }
        },
        {
          "id": "seriesToColumns",
          "options": {
            "byField": "persistentvolumeclaim"
          }
        },
        {
          "id": "organize",
          "options": {
            "excludeByName": {},
            "indexByName": {},
            "renameByName": {
              "Value #A (lastNotNull)": "Used",
              "Value #B (lastNotNull)": "Total",
              "persistentvolumeclaim": "Persistent Volume Claim"
            }
          }
        }
      ],
      "type": "table"
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
        "x": 0,
        "y": 81
      },
      "id": 32,
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
          "editorMode": "code",
          "exemplar": true,
          "expr": "sum(kubelet_volume_stats_inodes_used{node=\"$node\"}) by (persistentvolumeclaim) / sum(kubelet_volume_stats_inodes{node=\"$node\"}) by (persistentvolumeclaim) * 100",
          "interval": "$resolution",
          "legendFormat": "{{ persistentvolumeclaim }}",
          "range": true,
          "refId": "A"
        }
      ],
      "title": "Persistent Volumes - Inodes",
      "type": "timeseries"
    },
    {
      "collapsed": false,
      "datasource": {
        "type": "${grafana_datasource_type}",
        "uid": "${grafana_datasource_uid}"
      },
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 89
      },
      "id": 42,
      "panels": [],
      "title": "Node Storage",
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
          "unit": "percent"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 8,
        "w": 12,
        "x": 0,
        "y": 90
      },
      "id": 33,
      "options": {
        "legend": {
          "calcs": [],
          "displayMode": "hidden",
          "placement": "right"
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
          "editorMode": "code",
          "exemplar": true,
          "expr": "100 - ((node_filesystem_avail_bytes{instance=\"$instance\"} * 100) / node_filesystem_size_bytes{instance=\"$instance\"})",
          "hide": false,
          "interval": "$resolution",
          "legendFormat": "{{ mountpoint }}",
          "range": true,
          "refId": "A"
        }
      ],
      "title": "FS usage in %",
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
        "y": 90
      },
      "id": 59,
      "options": {
        "legend": {
          "calcs": [],
          "displayMode": "hidden",
          "placement": "right"
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
          "editorMode": "code",
          "exemplar": true,
          "expr": "100 - (node_filesystem_files_free{instance=\"$instance\"} / node_filesystem_files{instance=\"$instance\"} * 100)",
          "hide": false,
          "interval": "$resolution",
          "legendFormat": "{{ mountpoint }}",
          "range": true,
          "refId": "A"
        }
      ],
      "title": "FS inode usage in %",
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
          "unit": "bytes"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 8,
        "w": 12,
        "x": 0,
        "y": 98
      },
      "id": 52,
      "options": {
        "legend": {
          "calcs": [],
          "displayMode": "hidden",
          "placement": "right"
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
          "editorMode": "code",
          "exemplar": true,
          "expr": "rate(node_disk_read_bytes_total{instance=\"$instance\"}[$__rate_interval])",
          "interval": "$resolution",
          "legendFormat": "{{device}}",
          "range": true,
          "refId": "A"
        }
      ],
      "title": "Reads by disk (bytes)",
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
          "unit": "bytes"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 8,
        "w": 12,
        "x": 12,
        "y": 98
      },
      "id": 57,
      "options": {
        "legend": {
          "calcs": [],
          "displayMode": "hidden",
          "placement": "right"
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
          "editorMode": "code",
          "exemplar": true,
          "expr": "rate(node_disk_written_bytes_total{instance=\"$instance\"}[$__rate_interval])",
          "hide": false,
          "interval": "$resolution",
          "legendFormat": "{{device}}",
          "range": true,
          "refId": "A"
        }
      ],
      "title": "Writes by disk (bytes)",
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
          "unit": "read/s"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 8,
        "w": 12,
        "x": 0,
        "y": 106
      },
      "id": 51,
      "options": {
        "legend": {
          "calcs": [],
          "displayMode": "hidden",
          "placement": "right"
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
          "editorMode": "code",
          "exemplar": true,
          "expr": "rate(node_disk_reads_completed_total{instance=\"$instance\"}[$__rate_interval])",
          "interval": "$resolution",
          "legendFormat": "{{device}}",
          "range": true,
          "refId": "A"
        }
      ],
      "title": "Completed reads by disk",
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
          "unit": "write/s"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 8,
        "w": 12,
        "x": 12,
        "y": 106
      },
      "id": 56,
      "options": {
        "legend": {
          "calcs": [],
          "displayMode": "hidden",
          "placement": "right"
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
          "editorMode": "code",
          "exemplar": true,
          "expr": "rate(node_disk_writes_completed_total{instance=\"$instance\"}[$__rate_interval])",
          "hide": false,
          "interval": "$resolution",
          "legendFormat": "{{device}}",
          "range": true,
          "refId": "A"
        }
      ],
      "title": "Completed writes by disk",
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
          "unit": "io/s"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 8,
        "w": 12,
        "x": 0,
        "y": 114
      },
      "id": 58,
      "options": {
        "legend": {
          "calcs": [],
          "displayMode": "hidden",
          "placement": "right"
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
          "editorMode": "code",
          "exemplar": true,
          "expr": "rate(node_disk_io_now{instance=\"$instance\"}[$__rate_interval]) ",
          "interval": "$resolution",
          "legendFormat": "{{device}}",
          "range": true,
          "refId": "A"
        }
      ],
      "title": "Disk(s) io/s",
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
          "unit": "none"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 8,
        "w": 12,
        "x": 12,
        "y": 114
      },
      "id": 55,
      "options": {
        "legend": {
          "calcs": [],
          "displayMode": "hidden",
          "placement": "right"
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
          "editorMode": "code",
          "exemplar": true,
          "expr": "sum(node_filesystem_device_error) by (mountpoint)",
          "interval": "$resolution",
          "legendFormat": "{{ mountpoint }}",
          "range": true,
          "refId": "A"
        }
      ],
      "title": "FS - Device Errors",
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
          "text": "kubernetes-service-endpoints",
          "value": "kubernetes-service-endpoints"
        },
        "datasource": {
          "type": "${grafana_datasource_type}",
          "uid": "${grafana_datasource_uid}"
        },
        "definition": "label_values(node_uname_info, job)",
        "hide": 2,
        "includeAll": false,
        "multi": false,
        "name": "job",
        "options": [],
        "query": {
          "query": "label_values(node_uname_info, job)",
          "refId": "StandardVariableQuery"
        },
        "refresh": 1,
        "regex": "",
        "skipUrlSync": false,
        "sort": 1,
        "type": "query"
      },
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
        "type": "${grafana_datasource_type}"
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
      },
      {
        "current": {
          "selected": false,
          "text": "ip-192-168-115-12.us-west-2.compute.internal",
          "value": "ip-192-168-115-12.us-west-2.compute.internal"
        },
        "datasource": {
          "type": "${grafana_datasource_type}",
          "uid": "${grafana_datasource_uid}"
        },
        "definition": "label_values(kube_node_info, node)",
        "hide": 0,
        "includeAll": false,
        "multi": false,
        "name": "node",
        "options": [],
        "query": {
          "query": "label_values(kube_node_info, node)",
          "refId": "StandardVariableQuery"
        },
        "refresh": 2,
        "regex": "",
        "skipUrlSync": false,
        "sort": 1,
        "type": "query"
      },
      {
        "current": {
          "selected": false,
          "text": "192.168.115.12:9100",
          "value": "192.168.115.12:9100"
        },
        "datasource": {
          "type": "${grafana_datasource_type}",
          "uid": "${grafana_datasource_uid}"
        },
        "definition": "label_values(node_uname_info{nodename=~\"(?i:($node))\"}, instance)",
        "hide": 2,
        "includeAll": false,
        "multi": false,
        "name": "instance",
        "options": [],
        "query": {
          "query": "label_values(node_uname_info{nodename=~\"(?i:($node))\"}, instance)",
          "refId": "StandardVariableQuery"
        },
        "refresh": 2,
        "regex": "",
        "skipUrlSync": false,
        "sort": 1,
        "type": "query"
      }
    ]
  },
  "time": {
    "from": "now-1h",
    "to": "now"
  },
  "timepicker": {},
  "timezone": "",
  "title": "Kubernetes / Views / Nodes",
  "uid": "k8s_views_nodes",
  "version": 1,
  "weekStart": ""
}