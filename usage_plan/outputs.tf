output "id" {
  description = "The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of a usage plan resource."
  value       = oci_apigateway_usage_plan.this.id
}

output "compartment_id" {
  description = "The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment in which the resource is created."
  value       = oci_apigateway_usage_plan.this.compartment_id
}

output "display_name" {
  description = "A user-friendly name. Does not have to be unique, and it's changeable. Avoid entering confidential information.  Example: `My new resource`"
  value       = oci_apigateway_usage_plan.this.display_name
}

output "state" {
  description = "The current state of the usage plan."
  value       = oci_apigateway_usage_plan.this.state
}

output "time_created" {
  description = "The time this resource was created. An RFC3339 formatted datetime string."
  value       = oci_apigateway_usage_plan.this.time_created
}

output "time_updated" {
  description = "The time this resource was last updated. An RFC3339 formatted datetime string."
  value       = oci_apigateway_usage_plan.this.time_updated
}

output "entitlements" {
  description = "A collection of entitlements currently assigned to the usage plan."
  value       = oci_apigateway_usage_plan.this.entitlements
}
