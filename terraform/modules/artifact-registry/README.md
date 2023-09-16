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
| [google_artifact_registry_repository.artifact-registry](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/artifact_registry_repository) | resource |
| [google_artifact_registry_repository_iam_binding.binding](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/artifact_registry_repository_iam_binding) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The GCP project ID | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The Region of the Artifact Registry repository | `string` | `"asia-southeast1"` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the Artifact Registry repository | `string` | n/a | yes |
| <a name="input_description"></a> [description](#input\_description) | The description of the Artifact Registry repository | `string` | n/a | yes |
| <a name="input_members"></a> [members](#input\_members) | The members to be granted the role | `list(string)` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->