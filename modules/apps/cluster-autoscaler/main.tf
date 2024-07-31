resource "helm_release" "cluster-autoscaler" {
  name       = "cluster-autoscaler"
  repository = "https://kubernetes.github.io/autoscaler"
  chart      = "cluster-autoscaler"
  namespace  = "kube-system"

  values = [
    <<EOF
    cloudProvider: aws
    rbac:
      serviceAccount:
        name: cluster-autoscaler
        annotations: 
          eks.amazonaws.com/role-arn: arn:aws:iam::${var.account_id}:role/aws-cluster-autoscaler
    autoDiscovery:
      clusterName: ${var.cluster_name}
    extraArgs:
      scale-down-unneeded-time: "10m"
      scale-down-utilization-threshold: "0.5"
      scale-down-delay-after-add: "5m"
      scale-down-delay-after-delete: "1m"
      scale-down-delay-after-failure: "3m"
    EOF
  ]
}