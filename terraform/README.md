<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_google"></a> [google](#requirement\_google) | ~> 4.48.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | ~> 4.48.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cluster"></a> [cluster](#module\_cluster) | ./modules/gke | n/a |

## Resources

| Name | Type |
|------|------|
| [google_project_service.services](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_service) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The GCP project ID | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The Region of the GKE cluster | `string` | `"asia-southeast1"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment of the service | `string` | n/a | yes |
| <a name="input_services"></a> [services](#input\_services) | The services to deploy in gcp | `list(string)` | n/a | yes |
| <a name="input_node_pool_disk_capacity"></a> [node\_pool\_disk\_capacity](#input\_node\_pool\_disk\_capacity) | The disk capacity of the node pool | `number` | `100` | no |
| <a name="input_node_pool_machine_type"></a> [node\_pool\_machine\_type](#input\_node\_pool\_machine\_type) | The machine type of the node pool | `string` | `"n1-standard-1"` | no |
| <a name="input_node_pool_node_count"></a> [node\_pool\_node\_count](#input\_node\_pool\_node\_count) | The number of nodes in the node pool | `number` | `1` | no |
| <a name="input_node_pool_machine_spot_enable"></a> [node\_pool\_machine\_spot\_enable](#input\_node\_pool\_machine\_spot\_enable) | Enable spot instance for node pool | `bool` | `false` | no |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | The name of the VPC | `string` | n/a | yes |
| <a name="input_sn_name"></a> [sn\_name](#input\_sn\_name) | The name of the subnet | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_postgresql_user_password"></a> [postgresql\_user\_password](#output\_postgresql\_user\_password) | The password of the user |
<!-- END_TF_DOCS -->