output "id" {
  description = "The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the resource."
  value       = oci_apigateway_subscriber.this.id
}

output "compartment_id" {
  description = "The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment in which the resource is created."
  value       = oci_apigateway_subscriber.this.compartment_id
}

output "display_name" {
  description = "A user-friendly name. Does not have to be unique, and it's changeable. Avoid entering confidential information.  Example: `My new resource`"
  value       = oci_apigateway_subscriber.this.display_name
}

output "state" {
  description = "The current state of the subscriber."
  value       = oci_apigateway_subscriber.this.state
}

output "time_created" {
  description = "The time this resource was created. An RFC3339 formatted datetime string."
  value       = oci_apigateway_subscriber.this.time_created
}

output "time_updated" {
  description = "The time this resource was last updated. An RFC3339 formatted datetime string."
  value       = oci_apigateway_subscriber.this.time_updated
}

output "usage_plans" {
  description = "An array of [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm)s of usage plan resources."
  value       = oci_apigateway_subscriber.this.usage_plans
}
