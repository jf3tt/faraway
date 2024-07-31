provider "kubernetes" {
  host                   = var.cluster_endpoint
  token                  = data.aws_eks_cluster_auth.this.token
  cluster_ca_certificate = base64decode(var.cluster_certificate_authority_data)
}

data "aws_eks_cluster_auth" "this" {
  name = var.cluster_name
}