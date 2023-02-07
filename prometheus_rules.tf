resource "aws_prometheus_rule_group_namespace" "prometheus_rule_group" {
  name         = "rules"
  workspace_id = aws_prometheus_workspace.prometheus.id
  data         = <<EOF
groups:
  - name: kubernetes-apps
    rules:
    - alert: KubePodCrashLooping1
      expr: rate(kube_pod_container_status_restarts_total{job="kube-state-metrics",namespace=~".*"}[5m]) * 60 * 5 > 0
      for: 15m
      labels:
        severity: warning
      annotations:
        summary: Pod is crash looping.
    - alert: K8sPodRestartingTooMuch
      expr: rate(kube_pod_container_status_restarts_total[1m]) > 1 / (5 * 60)
      for: 30m
      labels:
        severity: warning
    - alert: PodFrequentlyRestarting
      expr: increase(kube_pod_container_status_restarts_total[1h]) > 5
      for: 10m
      labels:
        severity: warning
      annotations:
        summary: Pod is restarting frequently
    - alert: KubernetesPodNotHealthy
      expr: min_over_time(sum by (namespace, pod) (kube_pod_status_phase{phase=~"Pending|Unknown|Failed"})[15m:1m]) > 0
      for: 0m
      labels:
        severity: critical
      annotations:
        summary: Kubernetes Pod not healthy (instance {{ $labels.instance }})
    - alert:  KubePodCrashLooping
      expr:  max_over_time(kube_pod_container_status_waiting_reason{job="kube-state-metrics",namespace=~".*",reason="CrashLoopBackOff"}[5m]) >= 1
      for: 15m
      labels:
        severity: warning
      annotations:
        summary: Pod is crash looping.
    - alert:  KubePodNotReady
      expr:  sum by(namespace, pod, cluster) (max by(namespace, pod, cluster) (kube_pod_status_phase{job="kube-state-metrics",namespace=~".*",phase=~"Pending|Unknown"}) * on(namespace, pod, cluster) group_left(owner_kind) topk by(namespace, pod, cluster) (1, max by(namespace, pod, owner_kind, cluster) (kube_pod_owner{owner_kind!="Job"}))) > 0
      for: 15m
      labels:
        severity: warning
      annotations:
        summary: Pod has been in a non-ready state for more than 15 minutes.
    - alert: KubeDeploymentReplicasMismatch
      expr:  (kube_deployment_spec_replicas{job="kube-state-metrics",namespace=~".*"} > kube_deployment_status_replicas_available{job="kube-state-metrics",namespace=~".*"}) and (changes(kube_deployment_status_replicas_updated{job="kube-state-metrics",namespace=~".*"}[10m]) == 0)
      for: 15m
      labels:
        severity: warning
      annotations:
        summary: Deployment has not matched the expected number of replicas.
    - alert: KubeStatefulSetReplicasMismatch 
      expr:  (kube_statefulset_status_replicas_ready{job="kube-state-metrics",namespace=~".*"} != kube_statefulset_status_replicas{job="kube-state-metrics",namespace=~".*"}) and (changes(kube_statefulset_status_replicas_updated{job="kube-state-metrics",namespace=~".*"}[10m]) == 0)
      for: 15m
      labels:
        severity: warning
      annotations:
        summary: Deployment has not matched the expected number of replicas.
    - alert: KubeStatefulSetGenerationMismatch
      expr:   kube_statefulset_status_observed_generation{job="kube-state-metrics",namespace=~".*"} != kube_statefulset_metadata_generation{job="kube-state-metrics",namespace=~".*"}
      for: 15m
      labels:
        severity: warning
      annotations:
        summary: StatefulSet generation mismatch due to possible roll-back
    - alert: KubeStatefulSetUpdateNotRolledOut 
      expr:  (max without(revision) (kube_statefulset_status_current_revision{job="kube-state-metrics",namespace=~".*"} unless kube_statefulset_status_update_revision{job="kube-state-metrics",namespace=~".*"}) * (kube_statefulset_replicas{job="kube-state-metrics",namespace=~".*"} != kube_statefulset_status_replicas_updated{job="kube-state-metrics",namespace=~".*"})) and (changes(kube_statefulset_status_replicas_updated{job="kube-state-metrics",namespace=~".*"}[5m]) == 0)
      for: 15m
      labels:
        severity: warning
      annotations:
        summary:  StatefulSet update has not been rolled out.
    - alert:  KubeDaemonSetRolloutStuck
      expr:  ((kube_daemonset_status_current_number_scheduled{job="kube-state-metrics",namespace=~".*"} != kube_daemonset_status_desired_number_scheduled{job="kube-state-metrics",namespace=~".*"}) or (kube_daemonset_status_number_misscheduled{job="kube-state-metrics",namespace=~".*"} != 0) or (kube_daemonset_status_updated_number_scheduled{job="kube-state-metrics",namespace=~".*"} != kube_daemonset_status_desired_number_scheduled{job="kube-state-metrics",namespace=~".*"}) or (kube_daemonset_status_number_available{job="kube-state-metrics",namespace=~".*"} != kube_daemonset_status_desired_number_scheduled{job="kube-state-metrics",namespace=~".*"})) and (changes(kube_daemonset_status_updated_number_scheduled{job="kube-state-metrics",namespace=~".*"}[5m]) == 0)
      for: 15m
      labels:
        severity: warning
      annotations:
        summary:  DaemonSet rollout is stuck.
    - alert:  KubeContainerWaiting
      expr:  sum by(namespace, pod, container, cluster) (kube_pod_container_status_waiting_reason{job="kube-state-metrics",namespace=~".*"}) > 0
      for: 1h
      labels:
        severity: warning
      annotations:
        summary: Pod container waiting longer than 1 hour
    - alert:  KubeDaemonSetNotScheduled
      expr:  kube_daemonset_status_desired_number_scheduled{job="kube-state-metrics",namespace=~".*"} - kube_daemonset_status_current_number_scheduled{job="kube-state-metrics",namespace=~".*"} > 0
      for: 10m
      labels:
        severity: warning
      annotations:
        summary: DaemonSet pods are not scheduled.
    - alert: KubeDaemonSetMisScheduled 
      expr:  kube_daemonset_status_number_misscheduled{job="kube-state-metrics",namespace=~".*"} > 0
      for: 15m
      labels:
        severity: warning
      annotations:
        summary:  DaemonSet pods are misscheduled.
    - alert:  KubeJobNotCompleted
      expr:  time() - max by(namespace, job_name, cluster) (kube_job_status_start_time{job="kube-state-metrics",namespace=~".*"} and kube_job_status_active{job="kube-state-metrics",namespace=~".*"} > 0) > 43200
      for: 15m
      labels:
        severity: warning
      annotations:
        summary: Job did not complete in time
    - alert:  KubeJobFailed
      expr:  kube_job_failed{job="kube-state-metrics",namespace=~".*"} > 0
      for: 15m
      labels:
        severity: warning
      annotations:
        summary: Job failed to complete.
    - alert:  KubeHpaReplicasMismatch
      expr:  (kube_horizontalpodautoscaler_status_desired_replicas{job="kube-state-metrics",namespace=~".*"} != kube_horizontalpodautoscaler_status_current_replicas{job="kube-state-metrics",namespace=~".*"}) and (kube_horizontalpodautoscaler_status_current_replicas{job="kube-state-metrics",namespace=~".*"} > kube_horizontalpodautoscaler_spec_min_replicas{job="kube-state-metrics",namespace=~".*"}) and (kube_horizontalpodautoscaler_status_current_replicas{job="kube-state-metrics",namespace=~".*"} < kube_horizontalpodautoscaler_spec_max_replicas{job="kube-state-metrics",namespace=~".*"}) and changes(kube_horizontalpodautoscaler_status_current_replicas{job="kube-state-metrics",namespace=~".*"}[15m]) == 0
      for: 15m
      labels:
        severity: warning
      annotations:
        summary:   HPA has not matched descired number of replicas.
    - alert:  KubeHpaMaxedOut
      expr:   kube_horizontalpodautoscaler_status_current_replicas{job="kube-state-metrics",namespace=~".*"} == kube_horizontalpodautoscaler_spec_max_replicas{job="kube-state-metrics",namespace=~".*"}
      for: 15m
      labels:
        severity: warning
      annotations:
        summary: HPA is running at max replicas
  - name: kubernetes-resources
    rules:
    - alert:  KubeCPUOvercommit
      expr:   sum(namespace_cpu:kube_pod_container_resource_requests:sum) - (sum(kube_node_status_allocatable{resource="cpu"}) - max(kube_node_status_allocatable{resource="cpu"})) > 0 and (sum(kube_node_status_allocatable{resource="cpu"}) - max(kube_node_status_allocatable{resource="cpu"})) > 0
      for: 10m
      labels:
        severity: warning
      annotations:
        summary: Cluster has overcommitted CPU resource requests.
    - alert:  KubeMemoryOvercommit
      expr:   sum(namespace_memory:kube_pod_container_resource_requests:sum) - (sum(kube_node_status_allocatable{resource="memory"}) - max(kube_node_status_allocatable{resource="memory"})) > 0 and (sum(kube_node_status_allocatable{resource="memory"}) - max(kube_node_status_allocatable{resource="memory"})) > 0
      for: 10m
      labels:
        severity: warning
      annotations:
        summary:  Cluster has overcommitted memory resource requests.
  
    - alert:  KubeCPUQuotaOvercommit
      expr:    sum(min without(resource) (kube_resourcequota{job="kube-state-metrics",resource=~"(cpu|requests.cpu)",type="hard"})) / sum(kube_node_status_allocatable{job="kube-state-metrics",resource="cpu"}) > 1.5
      for: 5m
      labels:
        severity: warning
      annotations:
        summary: Cluster has overcommitted CPU resource requests.
    - alert:  KubeMemoryQuotaOvercommit
      expr:    sum(min without(resource) (kube_resourcequota{job="kube-state-metrics",resource=~"(memory|requests.memory)",type="hard"})) / sum(kube_node_status_allocatable{job="kube-state-metrics",resource="memory"}) > 1.5
      for: 5m
      labels:
        severity: warning
      annotations:
        summary: Cluster has overcommitted memory resource requests.
    - alert:  KubeMemoryQuotaOvercommit
      expr:    sum(min without(resource) (kube_resourcequota{job="kube-state-metrics",resource=~"(memory|requests.memory)",type="hard"})) / sum(kube_node_status_allocatable{job="kube-state-metrics",resource="memory"}) > 1.5
      for: 5m
      labels:
        severity: warning
      annotations:
        summary: Cluster has overcommitted memory resource requests.
    - alert:  KubeQuotaAlmostFull
      expr:    kube_resourcequota{job="kube-state-metrics",type="used"} / ignoring(instance, job, type) (kube_resourcequota{job="kube-state-metrics",type="hard"} > 0) > 0.9 < 1
      for: 15m
      labels:
        severity: info
      annotations:
        summary:   Namespace quota is going to be full.
    - alert:  KubeQuotaExceeded
      expr:    kube_resourcequota{job="kube-state-metrics",type="used"} / ignoring(instance, job, type) (kube_resourcequota{job="kube-state-metrics",type="hard"} > 0) > 1
      for: 15m
      labels:
        severity: warning
      annotations:
        summary: Namespace quota has exceeded the limits.
    - alert:  CPUThrottlingHigh
      expr:   sum by(container, pod, namespace) (increase(container_cpu_cfs_throttled_periods_total{container!=""}[5m])) / sum by(container, pod, namespace) (increase(container_cpu_cfs_periods_total[5m])) > (25 / 100)
      for: 15m
      labels:
        severity: info
      annotations:
        summary: Processes experience elevated CPU throttling. 
  - name: kubernetes-storage
    rules:
    - alert:  KubePersistentVolumeFillingUp
      expr:   (kubelet_volume_stats_available_bytes{job="kubelet",metrics_path="/metrics",namespace=~".*"} / kubelet_volume_stats_capacity_bytes{job="kubelet",metrics_path="/metrics",namespace=~".*"}) < 0.03 and kubelet_volume_stats_used_bytes{job="kubelet",metrics_path="/metrics",namespace=~".*"} > 0 unless on(namespace, persistentvolumeclaim) kube_persistentvolumeclaim_access_mode{access_mode="ReadOnlyMany"} == 1 unless on(namespace, persistentvolumeclaim) kube_persistentvolumeclaim_labels{label_excluded_from_alerts="true"} == 1
      for: 1m
      labels:
        severity: critical
      annotations:
        summary:  PersistentVolume is filling up.
    - alert:  KubePersistentVolumeFillingUp
      expr:   (kubelet_volume_stats_available_bytes{job="kubelet",metrics_path="/metrics",namespace=~".*"} / kubelet_volume_stats_capacity_bytes{job="kubelet",metrics_path="/metrics",namespace=~".*"}) < 0.15 and kubelet_volume_stats_used_bytes{job="kubelet",metrics_path="/metrics",namespace=~".*"} > 0 and predict_linear(kubelet_volume_stats_available_bytes{job="kubelet",metrics_path="/metrics",namespace=~".*"}[6h], 4 * 24 * 3600) < 0 unless on(namespace, persistentvolumeclaim) kube_persistentvolumeclaim_access_mode{access_mode="ReadOnlyMany"} == 1 unless on(namespace, persistentvolumeclaim) kube_persistentvolumeclaim_labels{label_excluded_from_alerts="true"} == 1
      for: 1h
      labels:
        severity: warning
      annotations:
        summary: PersistentVolume is filling up.
    - alert:  KubePersistentVolumeInodesFillingUp
      expr:    (kubelet_volume_stats_inodes_free{job="kubelet",metrics_path="/metrics",namespace=~".*"} / kubelet_volume_stats_inodes{job="kubelet",metrics_path="/metrics",namespace=~".*"}) < 0.03 and kubelet_volume_stats_inodes_used{job="kubelet",metrics_path="/metrics",namespace=~".*"} > 0 unless on(namespace, persistentvolumeclaim) kube_persistentvolumeclaim_access_mode{access_mode="ReadOnlyMany"} == 1 unless on(namespace, persistentvolumeclaim) kube_persistentvolumeclaim_labels{label_excluded_from_alerts="true"} == 1
      for: 1m
      labels:
        severity: critical
      annotations:
        summary: PersistentVolumeInodes are filling up.
    - alert: KubePersistentVolumeInodesFillingUp 
      expr:    (kubelet_volume_stats_inodes_free{job="kubelet",metrics_path="/metrics",namespace=~".*"} / kubelet_volume_stats_inodes{job="kubelet",metrics_path="/metrics",namespace=~".*"}) < 0.15 and kubelet_volume_stats_inodes_used{job="kubelet",metrics_path="/metrics",namespace=~".*"} > 0 and predict_linear(kubelet_volume_stats_inodes_free{job="kubelet",metrics_path="/metrics",namespace=~".*"}[6h], 4 * 24 * 3600) < 0 unless on(namespace, persistentvolumeclaim) kube_persistentvolumeclaim_access_mode{access_mode="ReadOnlyMany"} == 1 unless on(namespace, persistentvolumeclaim) kube_persistentvolumeclaim_labels{label_excluded_from_alerts="true"} == 1
      for: 1h
      labels:
        severity: warning
      annotations:
        summary: PersistentVolumeInodes are filling up.
    - alert:  KubePersistentVolumeErrors
      expr:   kube_persistentvolume_status_phase{job="kube-state-metrics",phase=~"Failed|Pending"} > 0
      for: 5m
      labels:
        severity: critical
      annotations:
        summary: PersistentVolume is having issues with provisioning.
  - name: kubernetes-system-kubelet
    rules:
    - alert:  KubeNodeNotReady
      expr:   kube_node_status_condition{condition="Ready",job="kube-state-metrics",status="true"} == 0
      for: 15m
      labels:
        severity: warning
      annotations:
        summary: Node is not ready.
    - alert:  KubeNodeUnreachable
      expr:   (kube_node_spec_taint{effect="NoSchedule",job="kube-state-metrics",key="node.kubernetes.io/unreachable"} unless ignoring(key, value) kube_node_spec_taint{job="kube-state-metrics",key=~"ToBeDeletedByClusterAutoscaler|cloud.google.com/impending-node-termination|aws-node-termination-handler/spot-itn"}) == 1
      for: 15m
      labels:
        severity: warning
      annotations:
        summary: Node is unreachable.
    - alert:  KubeletTooManyPods
      expr:   count by(cluster, node) ((kube_pod_status_phase{job="kube-state-metrics",phase="Running"} == 1) * on(instance, pod, namespace, cluster) group_left(node) topk by(instance, pod, namespace, cluster) (1, kube_pod_info{job="kube-state-metrics"})) / max by(cluster, node) (kube_node_status_capacity{job="kube-state-metrics",resource="pods"} != 1) > 0.95
      for: 15m
      labels:
        severity: info
      annotations:
        summary: Kubelet is running at capacity.
  - name: node-exporter
    rules:      
    - alert:  NodeFilesystemSpaceFillingUp
      expr:   (node_filesystem_avail_bytes{fstype!="",job="node-exporter"} / node_filesystem_size_bytes{fstype!="",job="node-exporter"} * 100 < 15 and predict_linear(node_filesystem_avail_bytes{fstype!="",job="node-exporter"}[6h], 24 * 60 * 60) < 0 and node_filesystem_readonly{fstype!="",job="node-exporter"} == 0)
      for: 1h
      labels:
        severity: critical
      annotations:
        summary: Filesystem is predicted to run out of space within the next 24 hours.
    - alert:  NodeFilesystemSpaceFillingUp
      expr:   (node_filesystem_avail_bytes{fstype!="",job="node-exporter"} / node_filesystem_size_bytes{fstype!="",job="node-exporter"} * 100 < 10 and predict_linear(node_filesystem_avail_bytes{fstype!="",job="node-exporter"}[6h], 4 * 60 * 60) < 0 and node_filesystem_readonly{fstype!="",job="node-exporter"} == 0)
      for: 15m
      labels:
        severity: info
      annotations:
        summary: 
    - alert:  NodeFilesystemAlmostOutOfSpace
      expr:   (node_filesystem_avail_bytes{fstype!="",job="node-exporter"} / node_filesystem_size_bytes{fstype!="",job="node-exporter"} * 100 < 5 and node_filesystem_readonly{fstype!="",job="node-exporter"} == 0)
      for: 30m
      labels:
        severity: warning
      annotations:
        summary: Filesystem has less than 5% space left.
    - alert:  NodeFilesystemAlmostOutOfSpace
      expr:   (node_filesystem_avail_bytes{fstype!="",job="node-exporter"} / node_filesystem_size_bytes{fstype!="",job="node-exporter"} * 100 < 3 and node_filesystem_readonly{fstype!="",job="node-exporter"} == 0)
      for: 30m
      labels:
        severity: critical
      annotations:
        summary: Filesystem has less than 3% space left.
    - alert:  NodeFilesystemFilesFillingUp
      expr:   (node_filesystem_files_free{fstype!="",job="node-exporter"} / node_filesystem_files{fstype!="",job="node-exporter"} * 100 < 40 and predict_linear(node_filesystem_files_free{fstype!="",job="node-exporter"}[6h], 24 * 60 * 60) < 0 and node_filesystem_readonly{fstype!="",job="node-exporter"} == 0)
      for: 1h
      labels:
        severity: warning
      annotations:
        summary: Filesystem is predicted to run out of inodes within the next 24 hours.
    - alert:  NodeFilesystemFilesFillingUp
      expr:    (node_filesystem_files_free{fstype!="",job="node-exporter"} / node_filesystem_files{fstype!="",job="node-exporter"} * 100 < 20 and predict_linear(node_filesystem_files_free{fstype!="",job="node-exporter"}[6h], 4 * 60 * 60) < 0 and node_filesystem_readonly{fstype!="",job="node-exporter"} == 0)
      for: 1h
      labels:
        severity: critical
      annotations:
        summary: Filesystem is predicted to run out of inodes within the next 4 hours.
    - alert:  NodeFilesystemAlmostOutOfFiles
      expr:   (node_filesystem_files_free{fstype!="",job="node-exporter"} / node_filesystem_files{fstype!="",job="node-exporter"} * 100 < 5 and node_filesystem_readonly{fstype!="",job="node-exporter"} == 0)
      for: 1h
      labels:
        severity: warning
      annotations:
        summary:   Filesystem has less than 5% inodes left.
    - alert:  NodeFilesystemAlmostOutOfFiles
      expr:   (node_filesystem_files_free{fstype!="",job="node-exporter"} / node_filesystem_files{fstype!="",job="node-exporter"} * 100 < 3 and node_filesystem_readonly{fstype!="",job="node-exporter"} == 0)
      for: 1h
      labels:
        severity: critical
      annotations:
        summary: Filesystem has less than 3% inodes left.
    - alert:  NodeNetworkReceiveErrs
      expr:   rate(node_network_receive_errs_total[2m]) / rate(node_network_receive_packets_total[2m]) > 0.01
      for: 1h
      labels:
        severity: warning
      annotations:
        summary: Network interface is reporting many receive errors.
    - alert:  NodeNetworkTransmitErrs
      expr:   rate(node_network_transmit_errs_total[2m]) / rate(node_network_transmit_packets_total[2m]) > 0.01
      for: 1h
      labels:
        severity: warning
      annotations:
        summary:  Network interface is reporting many transmit errors.
    - alert:  NodeHighNumberConntrackEntriesUsed
      expr:   (node_nf_conntrack_entries / node_nf_conntrack_entries_limit) > 0.75
      labels:
        severity: warning
      annotations:
        summary: Number of conntrack are getting close to the limit.
    - alert:  NodeTextFileCollectorScrapeError
      expr:   node_textfile_scrape_error{job="node-exporter"} == 1
      labels:
        severity: warning
      annotations:
        summary: Node Exporter text file collector failed to scrape.
    - alert:  NodeClockSkewDetected
      expr:   (node_timex_offset_seconds{job="node-exporter"} > 0.05 and deriv(node_timex_offset_seconds{job="node-exporter"}[5m]) >= 0) or (node_timex_offset_seconds{job="node-exporter"} < -0.05 and deriv(node_timex_offset_seconds{job="node-exporter"}[5m]) <= 0)
      for: 10m
      labels:
        severity: warning
      annotations:
        summary: Clock skew detected.
    - alert:  NodeClockNotSynchronising
      expr:   min_over_time(node_timex_sync_status{job="node-exporter"}[5m]) == 0 and node_timex_maxerror_seconds{job="node-exporter"} >= 16
      for: 10m
      labels:
        severity: warning
      annotations:
        summary: Clock not synchronising.
    - alert:  NodeRAIDDegraded
      expr:  node_md_disks_required{device=~"(/dev/)?(mmcblk.p.+|nvme.+|rbd.+|sd.+|vd.+|xvd.+|dm-.+|dasd.+)",job="node-exporter"} - ignoring(state) (node_md_disks{device=~"(/dev/)?(mmcblk.p.+|nvme.+|rbd.+|sd.+|vd.+|xvd.+|dm-.+|dasd.+)",job="node-exporter",state="active"}) > 0 
      for: 15m
      labels:
        severity: critical
      annotations:
        summary: RAID Array is degraded
    - alert:  NodeRAIDDiskFailure
      expr:   node_md_disks{device=~"(/dev/)?(mmcblk.p.+|nvme.+|rbd.+|sd.+|vd.+|xvd.+|dm-.+|dasd.+)",job="node-exporter",state="failed"} > 0
      labels:
        severity: info
      annotations:
        summary: Failed device in RAID array
    - alert:  NodeFileDescriptorLimit
      expr:   (node_filefd_allocated{job="node-exporter"} * 100 / node_filefd_maximum{job="node-exporter"} > 70)
      for: 15m
      labels:
        severity: warning
      annotations:
        summary: Kernel is predicted to exhaust file descriptors limit soon.
    - alert:  NodeFileDescriptorLimit
      expr:   (node_filefd_allocated{job="node-exporter"} * 100 / node_filefd_maximum{job="node-exporter"} > 90)
      for: 15m
      labels:
        severity:  critical
      annotations:
        summary: Kernel is predicted to exhaust file descriptors limit soon.
  - name: node-network
    rules:
    - alert:  NodeNetworkInterfaceFlapping
      expr:   changes(node_network_up{device!~"veth.+",job="node-exporter"}[2m]) > 2
      for: 2m
      labels:
        severity: warning
      annotations:
        summary: Network interface is often changing its status
EOF
}