## Тестовое задание на Devops
Что сделано:
Реализовал конфигурацию в terraform следующих компонентов:
- [VPC + сеть](modules/vpc/)
- [IRSA роли для подключения внутренних компонентов через OIDC](modules/iam/)
- [EKS](modules/eks/)
- [AWS Loadbalancer Controller](modules/apps/aws-loadbalancer-controller/)
- [Cluster Autoscaler](modules/apps/cluster-autoscaler/)
- [Metrics Server](modules/apps/metrics-server/)
- [Nginx + HPA](modules/apps/nginx/)
- [Promstack](modules/apps/promstack/)

Пример .tfvars лежит [тут](./production-example.tfvars)

## Demo
Демку с работой скейлинга можно посмотреть [здесь](https://www.youtube.com/watch?v=KJf4cFk-DpA) 

<!-- BEGIN_TF_DOCS -->

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
| <a name="input_account_id"></a> [account\_id](#input\_account\_id) | AWS Account ID to be used for resource creation. | `string` | n/a | yes |
| <a name="input_availability_zones"></a> [availability\_zones](#input\_availability\_zones) | List of availability zones in the region where the VPC will be created. | `list(string)` | <pre>[<br>  "us-east-1a",<br>  "us-east-1b",<br>  "us-east-1c"<br>]</pre> | no |
| <a name="input_cidr_block"></a> [cidr\_block](#input\_cidr\_block) | The CIDR block for the VPC. | `string` | `"10.10.0.0/16"` | no |
| <a name="input_cluster_endpoint_public_access"></a> [cluster\_endpoint\_public\_access](#input\_cluster\_endpoint\_public\_access) | Whether to enable public access to the EKS cluster endpoint. | `bool` | `true` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | The name of the EKS cluster. | `string` | `"faraway"` | no |
| <a name="input_cluster_version"></a> [cluster\_version](#input\_cluster\_version) | The version of the EKS cluster. | `string` | `"1.30"` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the VPC. | `string` | `"faraway"` | no |
| <a name="input_region"></a> [region](#input\_region) | The AWS region where the VPC will be created. | `string` | `"us-east-1"` | no |
| <a name="input_workers_instance_type"></a> [workers\_instance\_type](#input\_workers\_instance\_type) | The instance type for the worker nodes in the EKS cluster. | `list(string)` | <pre>[<br>  "t3.medium"<br>]</pre> | no |

<!-- END_TF_DOCS -->