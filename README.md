# terraform-module-template

<!-- TODO fill in resource name in link to product documentation -->
Terraform module for [Azure DNS Private Resolver](https://learn.microsoft.com/en-gb/azure/dns/dns-private-resolver-overview).

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azapi"></a> [azapi](#requirement\_azapi) | 1.0.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.26.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azapi"></a> [azapi](#provider\_azapi) | 1.0.0 |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >= 3.26.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ctags"></a> [ctags](#module\_ctags) | github.com/hmcts/terraform-module-common-tags | n/a |

## Resources

| Name | Type |
|------|------|
| [azapi_resource.inbound](https://registry.terraform.io/providers/Azure/azapi/1.0.0/docs/resources/resource) | resource |
| [azapi_resource.outbound](https://registry.terraform.io/providers/Azure/azapi/1.0.0/docs/resources/resource) | resource |
| [azapi_resource.resolver](https://registry.terraform.io/providers/Azure/azapi/1.0.0/docs/resources/resource) | resource |
| [azurerm_resource_group.new](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_subnet.inbound](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet.outbound](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_virtual_network.new](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |
| [azurerm_resource_group.existing](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |
| [azurerm_virtual_network.existing](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/virtual_network) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_builtFrom"></a> [builtFrom](#input\_builtFrom) | The URL of the repository from which the module is built. | `string` | n/a | yes |
| <a name="input_env"></a> [env](#input\_env) | Environment value. | `string` | n/a | yes |
| <a name="input_existing_resource_group_name"></a> [existing\_resource\_group\_name](#input\_existing\_resource\_group\_name) | Name of existing resource group to deploy resources into | `string` | `null` | no |
| <a name="input_existing_vnet_name"></a> [existing\_vnet\_name](#input\_existing\_vnet\_name) | Name of existing vnet | `string` | `null` | no |
| <a name="input_existing_vnet_resource_group"></a> [existing\_vnet\_resource\_group](#input\_existing\_vnet\_resource\_group) | Name of existing resource group containing the vnet | `string` | `null` | no |
| <a name="input_inbound_ip_prefix"></a> [inbound\_ip\_prefix](#input\_inbound\_ip\_prefix) | The IP prefix for the inbound resolver. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Target Azure location to deploy the resource | `string` | `"uksouth"` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the Private DNS Resolver | `string` | n/a | yes |
| <a name="input_outbound_ip_prefix"></a> [outbound\_ip\_prefix](#input\_outbound\_ip\_prefix) | The IP prefix for the outbound resolver. | `string` | n/a | yes |
| <a name="input_product"></a> [product](#input\_product) | https://hmcts.github.io/glossary/#product | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_resolver_id"></a> [resolver\_id](#output\_resolver\_id) | n/a |
<!-- END_TF_DOCS -->

## Contributing

We use pre-commit hooks for validating the terraform format and maintaining the documentation automatically.
Install it with:

```shell
$ brew install pre-commit terraform-docs
$ pre-commit install
```

If you add a new hook make sure to run it against all files:
```shell
$ pre-commit run --all-files
```
