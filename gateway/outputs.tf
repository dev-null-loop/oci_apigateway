output "id" {
  description = "The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the resource."
  value       = oci_apigateway_gateway.this.id
}

output "ip_addresses" {
  description = "An array of IP addresses associated with the gateway."
  value       = oci_apigateway_gateway.this.ip_addresses
}
