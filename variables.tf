# global

variable "account_id" {
  description = "AWS Account ID to be used for resource creation."
}

# vpc

variable "name" {
  description = "The name of the VPC."
}

variable "region" {
  description = "The AWS region where the VPC will be created."
}

variable "cidr_block" {
  description = "The CIDR block for the VPC."
}

variable "availability_zones" {
  description = "List of availability zones in the region where the VPC will be created."
}

# eks

variable "cluster_name" {
  description = "The name of the EKS cluster."
}

variable "cluster_version" {
  description = "The version of the EKS cluster."
}

variable "cluster_endpoint_public_access" {
  description = "Whether to enable public access to the EKS cluster endpoint."
}

variable "workers_instance_type" {
  description = "The instance type for the worker nodes in the EKS cluster."
}