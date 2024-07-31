resource "helm_release" "aws-loadbalancer-controller" {
  name       = "aws-loadbalancer-controller"
  repository = "https://aws.github.io/eks-charts"
  chart      = "aws-load-balancer-controller"
  namespace  = "kube-system"

  values = [
    <<EOF
    replicaCount: 1
    serviceAccount:
      create: true
      name: aws-loadbalancer-controller
      annotations: 
        eks.amazonaws.com/role-arn: arn:aws:iam::${var.account_id}:role/aws-loadbalancer-controller
    clusterName: ${var.cluster_name}
    nameOverride: aws-loadbalancer-controller
    EOF
  ]
}