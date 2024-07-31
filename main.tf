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

  vpc_id                         = module.vpc.vpc_id
  cluster_name                   = var.cluster_name
  cluster_version                = var.cluster_version
  cluster_endpoint_public_access = var.cluster_endpoint_public_access
  subnet_ids                     = module.vpc.subnet_ids
}

module "iam" {
  source            = "./modules/iam"
  oidc_provider_arn = module.eks.oidc_provider_arn
  cluster_name                       = var.cluster_name
}

module "aws-loadbalancer-controller" {
  source                             = "./modules/apps/aws-loadbalancer-controller"
  cluster_name                       = var.cluster_name
}

module "cluster-autoscaler" {
  source                             = "./modules/apps/cluster-autoscaler"
  cluster_name                       = var.cluster_name
}

module "promstack" {
  source                             = "./modules/apps/promstack"
}

module "nginx" {
  source                             = "./modules/apps/nginx"
}