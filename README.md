# terraform-module-template

<!-- TODO fill in resource name in link to product documentation -->
Terraform module for [Azure DNS Private Resolver](https://learn.microsoft.com/en-gb/azure/dns/dns-private-resolver-overview).

## Conditional Creations 
### Resource Group 
Use an existing resource by passing it to the module with the variable existing_resource_group_name or a new resource group will be created by the module.

### vNet
Use an existing vNet by passing it to the module with the variable existing_vnet_name or a new resource group will be created by the module.

### New vNet Peering and IP Routing
By passing the name of the hub vNet as hub_vnet_name, the module will create a peering between the vNet created by this module and the hub vNet.  It will then create an appropriate routing table.


<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.30.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.30.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ctags"></a> [ctags](#module\_ctags) | github.com/hmcts/terraform-module-common-tags | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_private_dns_resolver.resolver](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_resolver) | resource |
| [azurerm_private_dns_resolver_dns_forwarding_ruleset.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_resolver_dns_forwarding_ruleset) | resource |
| [azurerm_private_dns_resolver_forwarding_rule.name](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_resolver_forwarding_rule) | resource |
| [azurerm_private_dns_resolver_inbound_endpoint.inbound](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_resolver_inbound_endpoint) | resource |
| [azurerm_private_dns_resolver_outbound_endpoint.outbound](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_resolver_outbound_endpoint) | resource |
| [azurerm_resource_group.new](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_route.PrivateClassA](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/route) | resource |
| [azurerm_route.PrivateClassB](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/route) | resource |
| [azurerm_route.PrivateClassC](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/route) | resource |
| [azurerm_route_table.dnsrt](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/route_table) | resource |
| [azurerm_subnet.inbound](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet.outbound](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet_route_table_association.inbound](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_route_table_association) | resource |
| [azurerm_subnet_route_table_association.outbound](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_route_table_association) | resource |
| [azurerm_virtual_network.new](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |
| [azurerm_virtual_network_peering.dnsvnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_peering) | resource |
| [azurerm_virtual_network_peering.hubvnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_peering) | resource |
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
| <a name="input_hub_resource_group"></a> [hub\_resource\_group](#input\_hub\_resource\_group) | The name of the RG hosting the hub vNet | `string` | n/a | yes |
| <a name="input_hub_vnet_id"></a> [hub\_vnet\_id](#input\_hub\_vnet\_id) | The ID of the environment's hub vNet | `string` | n/a | yes |
| <a name="input_hub_vnet_name"></a> [hub\_vnet\_name](#input\_hub\_vnet\_name) | The name of the environment's hub vNet | `string` | n/a | yes |
| <a name="input_inbound_ip_prefix"></a> [inbound\_ip\_prefix](#input\_inbound\_ip\_prefix) | The IP prefix for the inbound resolver. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Target Azure location to deploy the resource | `string` | `"uksouth"` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the Private DNS Resolver | `string` | n/a | yes |
| <a name="input_outbound_ip_prefix"></a> [outbound\_ip\_prefix](#input\_outbound\_ip\_prefix) | The IP prefix for the outbound resolver. | `string` | n/a | yes |
| <a name="input_palo_alto_lb_ip"></a> [palo\_alto\_lb\_ip](#input\_palo\_alto\_lb\_ip) | The IP address of the Palo Alto load balancer | `string` | n/a | yes |
| <a name="input_product"></a> [product](#input\_product) | https://hmcts.github.io/glossary/#product | `string` | n/a | yes |
| <a name="input_rules"></a> [rules](#input\_rules) | The rules to be applied to the resolver. | <pre>list(object({<br>    name        = string<br>    domain_name = string<br>    target_dns_servers = list(object({<br>      ip_address = string<br>      port       = number<br>    }))<br>    enabled = bool<br>  }))</pre> | n/a | yes |

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
