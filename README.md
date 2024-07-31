<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_aws-loadbalancer-controller"></a> [aws-loadbalancer-controller](#module\_aws-loadbalancer-controller) | ./modules/apps/aws-loadbalancer-controller | n/a |
| <a name="module_cluster-autoscaler"></a> [cluster-autoscaler](#module\_cluster-autoscaler) | ./modules/apps/cluster-autoscaler | n/a |
| <a name="module_eks"></a> [eks](#module\_eks) | ./modules/eks | n/a |
| <a name="module_iam"></a> [iam](#module\_iam) | ./modules/iam | n/a |
| <a name="module_metrics-server"></a> [metrics-server](#module\_metrics-server) | ./modules/apps/metrics-server | n/a |
| <a name="module_nginx"></a> [nginx](#module\_nginx) | ./modules/apps/nginx | n/a |
| <a name="module_promstack"></a> [promstack](#module\_promstack) | ./modules/apps/promstack | n/a |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | ./modules/vpc | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_id"></a> [account\_id](#input\_account\_id) | AWS Account ID to be used for resource creation. | `any` | n/a | yes |
| <a name="input_availability_zones"></a> [availability\_zones](#input\_availability\_zones) | List of availability zones in the region where the VPC will be created. | `any` | n/a | yes |
| <a name="input_cidr_block"></a> [cidr\_block](#input\_cidr\_block) | The CIDR block for the VPC. | `any` | n/a | yes |
| <a name="input_cluster_endpoint_public_access"></a> [cluster\_endpoint\_public\_access](#input\_cluster\_endpoint\_public\_access) | Whether to enable public access to the EKS cluster endpoint. | `any` | n/a | yes |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | The name of the EKS cluster. | `any` | n/a | yes |
| <a name="input_cluster_version"></a> [cluster\_version](#input\_cluster\_version) | The version of the EKS cluster. | `any` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name of the VPC. | `any` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The AWS region where the VPC will be created. | `any` | n/a | yes |
| <a name="input_workers_instance_type"></a> [workers\_instance\_type](#input\_workers\_instance\_type) | The instance type for the worker nodes in the EKS cluster. | `any` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->