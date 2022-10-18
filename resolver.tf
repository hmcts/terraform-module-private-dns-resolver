resource "azapi_resource" "resolver" {
  type      = "Microsoft.Network/dnsResolvers@2022-07-01"
  name      = "${var.name}-resolver-${var.env}"
  parent_id = local.resource_group_id
  location  = local.location
  body = jsonencode({
    properties = {
      virtualNetwork = {
        id = local.vnet_id
      }
    }
  })
  response_export_values = ["properties.virtualnetwork.id"]
}

resource "azapi_resource" "inbound" {
  type      = "Microsoft.Network/dnsResolvers/inboundEndpoints@2022-07-01"
  name      = "inbound-endpoint-${var.env}"
  parent_id = azapi_resource.resolver.id
  location  = azapi_resource.resolver.location
  body = jsonencode({
    properties = {
      ipConfigurations = [{ subnet = {
        id = azurerm_subnet.inbound.id
      } }]
    }
  })

  depends_on = [
    azapi_resource.resolver
  ]
}

resource "azapi_resource" "outbound" {
  type      = "Microsoft.Network/dnsResolvers/outboundEndpoints@2022-07-01"
  name      = "outbound-endpoint-${var.env}"
  parent_id = azapi_resource.resolver.id
  location  = azapi_resource.resolver.location
  body = jsonencode({
    properties = {
      subnet = {
        id = azurerm_subnet.outbound.id
      }
    }
  })

  depends_on = [
    azapi_resource.resolver
  ]
}