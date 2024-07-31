# global

variable "account_id" {
  description = "AWS Account ID to be used for resource creation."
  type = string
}

# vpc

variable "name" {
  description = "The name of the VPC."
  default = "faraway"
  type = string
}

variable "region" {
  description = "The AWS region where the VPC will be created."
  default = "us-east-1"
  type = string
}

variable "cidr_block" {
  description = "The CIDR block for the VPC."
  default = "10.10.0.0/16"
  type = string
}

variable "availability_zones" {
  description = "List of availability zones in the region where the VPC will be created."
  default = ["us-east-1a", "us-east-1b", "us-east-1c"]
  type = list(string)
}

# eks

variable "cluster_name" {
  description = "The name of the EKS cluster."
  default = "faraway"
  type = string
}

variable "cluster_version" {
  description = "The version of the EKS cluster."
  default = "1.30"
  type = string
}

variable "cluster_endpoint_public_access" {
  description = "Whether to enable public access to the EKS cluster endpoint."
  default = true
  type = bool
}

variable "workers_instance_type" {
  description = "The instance type for the worker nodes in the EKS cluster."
  default = ["t3.medium"]
  type = list(string)
}