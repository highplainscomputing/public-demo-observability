resource "aws_prometheus_alert_manager_definition" "prometheus_alert_manager_definition" {
  workspace_id = aws_prometheus_workspace.prometheus.id
  definition   = <<EOF
alertmanager_config: |
  route:
    receiver: 'default'
  receivers:
    - name: 'default'
      sns_configs:
      - topic_arn: ${aws_sns_topic.prometheus_alert.arn}
        sigv4:
          region: ${data.aws_region.current.name}
EOF
}