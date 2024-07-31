resource "helm_release" "promstack" {
  name             = "promstack"
  create_namespace = true
  repository       = "https://prometheus-community.github.io/helm-charts"
  chart            = "kube-prometheus-stack"
  namespace        = "monitoring"

  values = [
    <<EOF
    grafana:
      adminUser: "admin"
      adminPassword: "admin"
      persistence:
        enabled: true
        storageClassName: "gp2"
        size: 5Gi
    prometheus:
      persistence:
        enabled: true
        storageClassName: "gp2"
        size: 10Gi
    EOF
  ]
}