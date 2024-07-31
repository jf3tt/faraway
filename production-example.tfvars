# global
account_id   = "1112223334"
region       = "us-east-1"

# vpc
name               = "faraway"
cidr_block         = "10.10.0.0/16"
availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]

# eks
cluster_name                   = "faraway"
cluster_version                = "1.30"
cluster_endpoint_public_access = true
workers_instance_type          = ["t3.medium"]