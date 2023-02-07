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
  "description": "This is a modern 'Pods View' dashboard for your Kubernetes cluster(s). Made for kube-prometheus-stack and take advantage of the latest Grafana features. GitHub repository: https://github.com/dotdc/grafana-dashboards-kubernetes",
  "editable": true,
  "fiscalYearStartMonth": 0,
  "gnetId": 15760,
  "graphTooltip": 1,
  "id": 13,
  "iteration": 1667477245906,
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
      "id": 43,
      "panels": [],
      "targets": [
        {
          "datasource": {
            "type": "datasource",
            "uid": "grafana"
          },
          "refId": "A"
        }
      ],
      "title": "Information",
      "type": "row"
    },
    {
      "datasource": {
        "type": "${grafana_datasource_type}",
        "uid": "${grafana_datasource_uid}"
      },
      "fieldConfig": {
        "defaults": {
          "mappings": [],
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
        "h": 2,
        "w": 12,
        "x": 0,
        "y": 1
      },
      "id": 2,
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
        "textMode": "name"
      },
      "pluginVersion": "8.4.7",
      "targets": [
        {
          "datasource": {
            "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "exemplar": true,
          "expr": "kube_pod_info{namespace=\"$namespace\", pod=\"$pod\"}",
          "interval": "",
          "legendFormat": "{{ created_by_kind }}: {{ created_by_name }}",
          "refId": "A"
        }
      ],
      "title": "Created by",
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
        "h": 2,
        "w": 6,
        "x": 12,
        "y": 1
      },
      "id": 33,
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
        "textMode": "name"
      },
      "pluginVersion": "8.4.7",
      "targets": [
        {
          "datasource": {
            "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "expr": "kube_pod_info{namespace=\"$namespace\", pod=\"$pod\"}",
          "interval": "",
          "legendFormat": "{{ node }}",
          "refId": "A"
        }
      ],
      "title": "Running on",
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
        "h": 2,
        "w": 6,
        "x": 18,
        "y": 1
      },
      "id": 41,
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
        "textMode": "name"
      },
      "pluginVersion": "8.4.7",
      "targets": [
        {
          "datasource": {
            "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "expr": "kube_pod_info{namespace=\"$namespace\", pod=\"$pod\"}",
          "interval": "",
          "legendFormat": "{{ pod_ip }}",
          "refId": "A"
        }
      ],
      "title": "Pod IP",
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
        "y": 3
      },
      "id": 47,
      "panels": [],
      "targets": [
        {
          "datasource": {
            "type": "datasource",
            "uid": "grafana"
          },
          "refId": "A"
        }
      ],
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
            "fixedColor": "blue",
            "mode": "fixed"
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
                "color": "#EAB839",
                "value": 60
              },
              {
                "color": "red",
                "value": 75
              }
            ]
          },
          "unit": "percentunit"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 8,
        "w": 3,
        "x": 0,
        "y": 4
      },
      "id": 39,
      "options": {
        "orientation": "auto",
        "reduceOptions": {
          "calcs": [
            "last"
          ],
          "fields": "",
          "values": false
        },
        "showThresholdLabels": false,
        "showThresholdMarkers": true
      },
      "pluginVersion": "8.4.7",
      "targets": [
        {
          "datasource": {
            "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "exemplar": false,
          "expr": "sum(rate(container_cpu_usage_seconds_total{namespace=\"$namespace\", pod=\"$pod\", image!=\"\"}[$__rate_interval])) / sum(kube_pod_container_resource_requests{namespace=\"$namespace\", pod=\"$pod\", unit=\"core\"})",
          "instant": true,
          "interval": "$resolution",
          "legendFormat": "Requests",
          "refId": "A"
        }
      ],
      "title": "Total pod CPU Requests usage",
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
                "color": "#EAB839",
                "value": 60
              },
              {
                "color": "red",
                "value": 75
              }
            ]
          },
          "unit": "percentunit"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 8,
        "w": 3,
        "x": 3,
        "y": 4
      },
      "id": 48,
      "options": {
        "orientation": "auto",
        "reduceOptions": {
          "calcs": [
            "last"
          ],
          "fields": "",
          "values": false
        },
        "showThresholdLabels": false,
        "showThresholdMarkers": true
      },
      "pluginVersion": "8.4.7",
      "targets": [
        {
          "datasource": {
            "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "exemplar": false,
          "expr": "sum(rate(container_cpu_usage_seconds_total{namespace=\"$namespace\", pod=\"$pod\", image!=\"\"}[$__rate_interval])) / sum(kube_pod_container_resource_limits{namespace=\"$namespace\", pod=\"$pod\", unit=\"core\"})",
          "instant": true,
          "interval": "$resolution",
          "legendFormat": "Limits",
          "refId": "A"
        }
      ],
      "title": "Total pod CPU Limits usage",
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
            "fixedColor": "blue",
            "mode": "fixed"
          },
          "decimals": 2,
          "mappings": [],
          "max": 1,
          "min": 0,
          "thresholds": {
            "mode": "percentage",
            "steps": [
              {
                "color": "blue",
                "value": null
              },
              {
                "color": "#EAB839",
                "value": 80
              },
              {
                "color": "red",
                "value": 99
              }
            ]
          },
          "unit": "percentunit"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 8,
        "w": 3,
        "x": 6,
        "y": 4
      },
      "id": 40,
      "options": {
        "orientation": "auto",
        "reduceOptions": {
          "calcs": [
            "last"
          ],
          "fields": "",
          "values": false
        },
        "showThresholdLabels": false,
        "showThresholdMarkers": true
      },
      "pluginVersion": "8.4.7",
      "targets": [
        {
          "datasource": {
            "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "exemplar": false,
          "expr": "sum(container_memory_working_set_bytes{namespace=\"$namespace\", pod=\"$pod\", image!=\"\"}) / sum(kube_pod_container_resource_requests{namespace=\"$namespace\", pod=\"$pod\", unit=\"byte\"})",
          "instant": true,
          "interval": "$resolution",
          "legendFormat": "Requests",
          "refId": "A"
        }
      ],
      "title": "Total pod RAM Requests usage",
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
                "color": "#EAB839",
                "value": 60
              },
              {
                "color": "red",
                "value": 75
              }
            ]
          },
          "unit": "percentunit"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 8,
        "w": 3,
        "x": 9,
        "y": 4
      },
      "id": 49,
      "options": {
        "orientation": "auto",
        "reduceOptions": {
          "calcs": [
            "last"
          ],
          "fields": "",
          "values": false
        },
        "showThresholdLabels": false,
        "showThresholdMarkers": true
      },
      "pluginVersion": "8.4.7",
      "targets": [
        {
          "datasource": {
            "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "exemplar": false,
          "expr": "sum(container_memory_working_set_bytes{namespace=\"$namespace\", pod=\"$pod\", image!=\"\"}) / sum(kube_pod_container_resource_limits{namespace=\"$namespace\", pod=\"$pod\", unit=\"byte\"}) ",
          "instant": true,
          "interval": "$resolution",
          "legendFormat": "Limits",
          "refId": "B"
        }
      ],
      "title": "Total pod RAM Limits usage",
      "type": "gauge"
    },
    {
      "datasource": {
        "type": "${grafana_datasource_type}",
        "uid": "${grafana_datasource_uid}"
      },
      "fieldConfig": {
        "defaults": {
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
                "color": "blue",
                "value": null
              }
            ]
          },
          "unit": "none"
        },
        "overrides": [
          {
            "matcher": {
              "id": "byName",
              "options": "Memory Requests"
            },
            "properties": [
              {
                "id": "unit",
                "value": "bytes"
              }
            ]
          },
          {
            "matcher": {
              "id": "byName",
              "options": "Memory Limits"
            },
            "properties": [
              {
                "id": "unit",
                "value": "bytes"
              }
            ]
          },
          {
            "matcher": {
              "id": "byName",
              "options": "Memory Used"
            },
            "properties": [
              {
                "id": "unit",
                "value": "bytes"
              }
            ]
          }
        ]
      },
      "gridPos": {
        "h": 8,
        "w": 12,
        "x": 12,
        "y": 4
      },
      "id": 38,
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
          "exemplar": false,
          "expr": "sum(kube_pod_container_resource_requests{namespace=\"$namespace\", pod=\"$pod\", unit=\"core\"}) by (container)",
          "format": "table",
          "instant": true,
          "interval": "",
          "intervalFactor": 1,
          "legendFormat": "",
          "refId": "A"
        },
        {
          "datasource": {
            "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "exemplar": false,
          "expr": "sum(kube_pod_container_resource_limits{namespace=\"$namespace\", pod=\"$pod\", unit=\"core\"}) by (container)",
          "format": "table",
          "instant": true,
          "interval": "",
          "intervalFactor": 1,
          "legendFormat": "",
          "refId": "B"
        },
        {
          "datasource": {
            "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "exemplar": false,
          "expr": "sum(kube_pod_container_resource_requests{namespace=\"$namespace\", pod=\"$pod\", unit=\"byte\"}) by (container)",
          "format": "table",
          "instant": true,
          "interval": "",
          "legendFormat": "",
          "refId": "C"
        },
        {
          "datasource": {
            "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "exemplar": false,
          "expr": "sum(kube_pod_container_resource_limits{namespace=\"$namespace\", pod=\"$pod\", unit=\"byte\"}) by (container)",
          "format": "table",
          "instant": true,
          "interval": "",
          "legendFormat": "",
          "refId": "D"
        },
        {
          "datasource": {
            "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "editorMode": "code",
          "exemplar": false,
          "expr": "sum(rate(container_cpu_usage_seconds_total{namespace=\"$namespace\", pod=\"$pod\", image!=\"\", container!=\"POD\"}[$__rate_interval])) by (container)",
          "format": "table",
          "hide": false,
          "instant": true,
          "legendFormat": "__auto",
          "range": false,
          "refId": "E"
        },
        {
          "datasource": {
            "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "editorMode": "code",
          "exemplar": false,
          "expr": "sum(container_memory_working_set_bytes{namespace=\"$namespace\", pod=\"$pod\", image!=\"\", container!=\"POD\"}) by (container)",
          "format": "table",
          "hide": false,
          "instant": true,
          "range": false,
          "refId": "F"
        }
      ],
      "title": "Resources by container",
      "transformations": [
        {
          "id": "seriesToColumns",
          "options": {
            "byField": "container"
          }
        },
        {
          "id": "organize",
          "options": {
            "excludeByName": {
              "Time": true,
              "Time 1": true,
              "Time 2": true,
              "Time 4": true,
              "__name__": true,
              "__name__ 1": true,
              "__name__ 2": true,
              "__name__ 3": true,
              "__name__ 4": true,
              "container": false,
              "endpoint": true,
              "endpoint 2": true,
              "endpoint 3": true,
              "endpoint 4": true,
              "instance": true,
              "instance 2": true,
              "instance 3": true,
              "instance 4": true,
              "job": true,
              "job 2": true,
              "job 3": true,
              "job 4": true,
              "namespace": true,
              "namespace 2": true,
              "namespace 3": true,
              "namespace 4": true,
              "node": true,
              "node 2": true,
              "node 3": true,
              "node 4": true,
              "pod": true,
              "pod 2": true,
              "pod 3": true,
              "pod 4": true,
              "resource 1": true,
              "resource 2": true,
              "resource 3": true,
              "resource 4": true,
              "service": true,
              "service 2": true,
              "service 3": true,
              "service 4": true,
              "uid 1": true,
              "uid 2": true,
              "uid 3": true,
              "uid 4": true,
              "unit 1": true,
              "unit 2": true,
              "unit 3": true,
              "unit 4": true
            },
            "indexByName": {
              "Time 1": 7,
              "Time 2": 8,
              "Time 3": 9,
              "Time 4": 10,
              "Time 5": 11,
              "Time 6": 12,
              "Value #A": 2,
              "Value #B": 3,
              "Value #C": 5,
              "Value #D": 6,
              "Value #E": 1,
              "Value #F": 4,
              "container": 0
            },
            "renameByName": {
              "Value #A": "CPU Requests",
              "Value #B": "CPU Limits",
              "Value #C": "Memory Requests",
              "Value #D": "Memory Limits",
              "Value #E": "CPU Used",
              "Value #F": "Memory Used",
              "container": "Container"
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
            "mode": "thresholds"
          },
          "custom": {
            "axisLabel": "Percent",
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
              "mode": "area"
            }
          },
          "mappings": [],
          "max": 1,
          "min": 0,
          "thresholds": {
            "mode": "percentage",
            "steps": [
              {
                "color": "red",
                "value": null
              },
              {
                "color": "yellow",
                "value": 20
              },
              {
                "color": "green",
                "value": 30
              },
              {
                "color": "yellow",
                "value": 70
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
        "y": 12
      },
      "id": 50,
      "options": {
        "legend": {
          "calcs": [],
          "displayMode": "table",
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
          "expr": "sum(rate(container_cpu_usage_seconds_total{namespace=\"$namespace\", pod=\"$pod\", image!=\"\"}[$__rate_interval])) by (container) / sum(kube_pod_container_resource_requests{namespace=\"$namespace\", pod=\"$pod\", unit=\"core\"}) by (container)",
          "interval": "$resolution",
          "legendFormat": "{{ container }}  REQUESTS",
          "range": true,
          "refId": "A"
        },
        {
          "datasource": {
            "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "editorMode": "code",
          "expr": "sum(rate(container_cpu_usage_seconds_total{namespace=\"$namespace\", pod=\"$pod\", image!=\"\"}[$__rate_interval])) by (container) / sum(kube_pod_container_resource_limits{namespace=\"$namespace\", pod=\"$pod\", unit=\"core\"}) by (container)",
          "hide": false,
          "legendFormat": "{{ container }}  LIMITS",
          "range": true,
          "refId": "B"
        }
      ],
      "title": "CPU Usage / Requests & Limits by container",
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
            "fixedColor": "blue",
            "mode": "thresholds"
          },
          "custom": {
            "axisLabel": "Percent",
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
              "mode": "area"
            }
          },
          "mappings": [],
          "max": 1,
          "min": 0,
          "thresholds": {
            "mode": "percentage",
            "steps": [
              {
                "color": "red",
                "value": null
              },
              {
                "color": "yellow",
                "value": 20
              },
              {
                "color": "green",
                "value": 30
              },
              {
                "color": "#EAB839",
                "value": 70
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
        "x": 12,
        "y": 12
      },
      "id": 30,
      "options": {
        "legend": {
          "calcs": [],
          "displayMode": "table",
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
          "expr": "sum(container_memory_working_set_bytes{namespace=\"$namespace\", pod=\"$pod\", image!=\"\"}) by (container) / sum(kube_pod_container_resource_requests{namespace=\"$namespace\", pod=\"$pod\", unit=\"byte\"}) by (container)",
          "interval": "",
          "legendFormat": "{{ container }} REQUESTS",
          "range": true,
          "refId": "A"
        },
        {
          "datasource": {
            "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "editorMode": "code",
          "expr": "sum(container_memory_working_set_bytes{namespace=\"$namespace\", pod=\"$pod\", image!=\"\"}) by (container) / sum(kube_pod_container_resource_limits{namespace=\"$namespace\", pod=\"$pod\", unit=\"byte\"}) by (container)",
          "hide": false,
          "legendFormat": "{{ container }} LIMITS",
          "range": true,
          "refId": "B"
        }
      ],
      "title": "Memory Usage / Requests & Limits by container",
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
        "overrides": [
          {
            "matcher": {
              "id": "byName",
              "options": "limit"
            },
            "properties": [
              {
                "id": "color",
                "value": {
                  "fixedColor": "#F2495C",
                  "mode": "fixed"
                }
              },
              {
                "id": "custom.fillOpacity",
                "value": 0
              }
            ]
          }
        ]
      },
      "gridPos": {
        "h": 8,
        "w": 12,
        "x": 0,
        "y": 20
      },
      "id": 29,
      "options": {
        "legend": {
          "calcs": [],
          "displayMode": "table",
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
          "exemplar": true,
          "expr": "sum(rate(container_cpu_usage_seconds_total{namespace=\"$namespace\", pod=\"$pod\", image!=\"\", container!=\"POD\"}[$__rate_interval])) by (container)",
          "interval": "$resolution",
          "legendFormat": "{{ container }}",
          "refId": "A"
        }
      ],
      "title": "CPU Usage by container",
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
            "axisLabel": "Bytes",
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
        "y": 20
      },
      "id": 51,
      "options": {
        "legend": {
          "calcs": [],
          "displayMode": "table",
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
          "exemplar": true,
          "expr": "sum(container_memory_working_set_bytes{namespace=\"$namespace\", pod=\"$pod\", image!=\"\", container!=\"POD\"}) by (container)",
          "interval": "",
          "legendFormat": "{{ container }}",
          "refId": "A"
        }
      ],
      "title": "Memory Usage by container",
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
        "y": 28
      },
      "id": 45,
      "panels": [],
      "targets": [
        {
          "datasource": {
            "type": "datasource",
            "uid": "grafana"
          },
          "refId": "A"
        }
      ],
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
        "x": 0,
        "y": 29
      },
      "id": 31,
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
      "pluginVersion": "8.3.3",
      "targets": [
        {
          "datasource": {
            "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "exemplar": true,
          "expr": "sum(rate(container_network_receive_bytes_total{namespace=\"$namespace\", pod=\"$pod\"}[$__rate_interval]))",
          "interval": "$resolution",
          "legendFormat": "Received",
          "refId": "A"
        },
        {
          "datasource": {
            "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "exemplar": true,
          "expr": "- sum(rate(container_network_transmit_bytes_total{namespace=\"$namespace\", pod=\"$pod\"}[$__rate_interval]))",
          "interval": "$resolution",
          "legendFormat": "Transmitted",
          "refId": "B"
        }
      ],
      "title": "Network - Bandwidth",
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
        "x": 12,
        "y": 29
      },
      "id": 34,
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
      "pluginVersion": "8.3.3",
      "targets": [
        {
          "datasource": {
            "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "exemplar": true,
          "expr": "sum(rate(container_network_receive_packets_total{namespace=\"$namespace\", pod=\"$pod\"}[$__rate_interval]))",
          "interval": "$resolution",
          "legendFormat": "Received",
          "refId": "A"
        },
        {
          "datasource": {
            "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "exemplar": true,
          "expr": "- sum(rate(container_network_transmit_packets_total{namespace=\"$namespace\", pod=\"$pod\"}[$__rate_interval]))",
          "interval": "$resolution",
          "legendFormat": "Transmitted",
          "refId": "B"
        }
      ],
      "title": "Network - Packets Rate",
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
        "y": 37
      },
      "id": 36,
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
      "pluginVersion": "8.3.3",
      "targets": [
        {
          "datasource": {
            "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "exemplar": true,
          "expr": "sum(rate(container_network_receive_packets_dropped_total{namespace=\"$namespace\", pod=\"$pod\"}[$__rate_interval]))",
          "interval": "$resolution",
          "legendFormat": "Received",
          "refId": "A"
        },
        {
          "datasource": {
            "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "exemplar": true,
          "expr": "- sum(rate(container_network_transmit_packets_dropped_total{namespace=\"$namespace\", pod=\"$pod\"}[$__rate_interval]))",
          "interval": "$resolution",
          "legendFormat": "Transmitted",
          "refId": "B"
        }
      ],
      "title": "Network - Packets Dropped",
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
        "x": 12,
        "y": 37
      },
      "id": 37,
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
      "pluginVersion": "8.3.3",
      "targets": [
        {
          "datasource": {
            "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "exemplar": true,
          "expr": "sum(rate(container_network_receive_errors_total{namespace=\"$namespace\", pod=\"$pod\"}[$__rate_interval]))",
          "interval": "$resolution",
          "legendFormat": "Received",
          "refId": "A"
        },
        {
          "datasource": {
            "type": "${grafana_datasource_type}",
            "uid": "${grafana_datasource_uid}"
          },
          "exemplar": true,
          "expr": "- sum(rate(container_network_transmit_errors_total{namespace=\"$namespace\", pod=\"$pod\"}[$__rate_interval]))",
          "interval": "$resolution",
          "legendFormat": "Transmitted",
          "refId": "B"
        }
      ],
      "title": "Network - Errors",
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
          "selected": false,
          "text": "monitoring",
          "value": "monitoring"
        },
        "datasource": {
          "type": "${grafana_datasource_type}",
          "uid": "${grafana_datasource_uid}"
        },
        "definition": "label_values(kube_pod_info, namespace)",
        "hide": 0,
        "includeAll": false,
        "multi": false,
        "name": "namespace",
        "options": [],
        "query": {
          "query": "label_values(kube_pod_info, namespace)",
          "refId": "Prometheus-namespace-Variable-Query"
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
          "selected": false,
          "text": "monitoring-kube-state-metrics-65867d8646-lwlcv",
          "value": "monitoring-kube-state-metrics-65867d8646-lwlcv"
        },
        "datasource": {
          "type": "${grafana_datasource_type}",
          "uid": "${grafana_datasource_uid}"
        },
        "definition": "label_values(kube_pod_info{namespace=\"$namespace\"}, pod)",
        "hide": 0,
        "includeAll": false,
        "multi": false,
        "name": "pod",
        "options": [],
        "query": {
          "query": "label_values(kube_pod_info{namespace=\"$namespace\"}, pod)",
          "refId": "Prometheus-pod-Variable-Query"
        },
        "refresh": 2,
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
  "title": "Kubernetes / Views / Pods",
  "uid": "k8s_views_pods",
  "version": 1,
  "weekStart": ""
}