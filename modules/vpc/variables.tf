variable "region" {
  description = "The AWS region."
}

variable "cluster_name" {

}

variable "name" {
  type = string
}

# variable "vpc_subnet" {
#   description = "The CIDR block for the VPC."
# }

variable "cidr_block" {
  type = string
}

variable "availability_zones" {
  description = "A list of availability zones and their associated subnet CIDR blocks."
  type        = list(string)
}

# variable "vpc_id" {
#   type        = string
#   description = "The ID of the VPC in which resources will be created."
# }
