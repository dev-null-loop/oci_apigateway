output "id" {
  description = "The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the resource."
  value       = oci_apigateway_deployment.this.id
}

output "compartment_id" {
  description = "The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment in which the resource is created."
  value       = oci_apigateway_deployment.this.compartment_id
}

output "gateway_id" {
  description = "The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the resource."
  value       = oci_apigateway_deployment.this.gateway_id
}

output "path_prefix" {
  description = "A path on which to deploy all routes contained in the API deployment specification. For more information, see [Deploying an API on an API Gateway by Creating an API Deployment](https://docs.cloud.oracle.com/iaas/Content/APIGateway/Tasks/apigatewaycreatingdeployment.htm)."
  value       = oci_apigateway_deployment.this.path_prefix
}

output "display_name" {
  description = "A user-friendly name. Does not have to be unique, and it's changeable. Avoid entering confidential information.  Example: `My new resource`"
  value       = oci_apigateway_deployment.this.display_name
}

output "endpoint" {
  description = "The endpoint to access this deployment on the gateway."
  value       = oci_apigateway_deployment.this.endpoint
}

output "lifecycle_details" {
  description = "A message describing the current state in more detail. For example, can be used to provide actionable information for a resource in a Failed state."
  value       = oci_apigateway_deployment.this.lifecycle_details
}
