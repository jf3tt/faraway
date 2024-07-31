module "vpc" {
  source             = "./modules/vpc"
  cluster_name       = var.cluster_name
  name               = var.name
  region             = var.region
  cidr_block         = var.cidr_block
  availability_zones = var.availability_zones
}

module "eks" {
  source = "./modules/eks"

  account_id                     = var.account_id
  workers_instance_type          = var.workers_instance_type
  vpc_id                         = module.vpc.vpc_id
  cluster_name                   = var.cluster_name
  cluster_version                = var.cluster_version
  cluster_endpoint_public_access = var.cluster_endpoint_public_access
  subnet_ids                     = module.vpc.subnet_ids
  depends_on                     = [module.vpc]
}

module "iam" {
  source            = "./modules/iam"
  oidc_provider_arn = module.eks.oidc_provider_arn
  cluster_name      = var.cluster_name
}

module "metrics-server" {
  source = "./modules/apps/metrics-server"
}

module "aws-loadbalancer-controller" {
  source       = "./modules/apps/aws-loadbalancer-controller"
  cluster_name = var.cluster_name
  account_id   = var.account_id
  depends_on   = [module.eks]
}

module "cluster-autoscaler" {
  source       = "./modules/apps/cluster-autoscaler"
  account_id   = var.account_id
  cluster_name = var.cluster_name
  depends_on   = [module.eks]
}

module "promstack" {
  source     = "./modules/apps/promstack"
  depends_on = [module.eks]
}

module "nginx" {
  source     = "./modules/apps/nginx"
  depends_on = [module.eks]
}