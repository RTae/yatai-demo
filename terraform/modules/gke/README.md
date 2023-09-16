<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_container_cluster.gke_cluster](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_cluster) | resource |
| [google_container_node_pool.gke_pool](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_node_pool) | resource |
| [google_service_account.sa](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account) | resource |
| [google_compute_network.gke_network_vpc](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/compute_network) | data source |
| [google_compute_subnetwork.gke_network_sn](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/compute_subnetwork) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The GCP project ID | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The Region of the GKE cluster | `string` | `"asia-southeast1-a"` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the GKE cluster | `string` | n/a | yes |
| <a name="input_description"></a> [description](#input\_description) | The description of the GKE cluster | `string` | n/a | yes |
| <a name="input_display_name"></a> [display\_name](#input\_display\_name) | The display name of the GKE cluster | `string` | n/a | yes |
| <a name="input_node_pool_disk_capacity"></a> [node\_pool\_disk\_capacity](#input\_node\_pool\_disk\_capacity) | The disk capacity of the GKE node pool in GB | `number` | `16` | no |
| <a name="input_node_pool_machine_type"></a> [node\_pool\_machine\_type](#input\_node\_pool\_machine\_type) | The machine type of the GKE node pool | `string` | `"n1-standard-1"` | no |
| <a name="input_node_pool_node_count"></a> [node\_pool\_node\_count](#input\_node\_pool\_node\_count) | The number of nodes in the GKE cluster | `string` | `"1"` | no |
| <a name="input_node_pool_machine_spot_enable"></a> [node\_pool\_machine\_spot\_enable](#input\_node\_pool\_machine\_spot\_enable) | Enable spot instance for GKE node pool | `bool` | `false` | no |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | The name of the VPC | `string` | n/a | yes |
| <a name="input_sn_name"></a> [sn\_name](#input\_sn\_name) | The name of the subnetwork in VPC | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_sa_email"></a> [sa\_email](#output\_sa\_email) | n/a |
| <a name="output_cluster_name"></a> [cluster\_name](#output\_cluster\_name) | n/a |
<!-- END_TF_DOCS -->