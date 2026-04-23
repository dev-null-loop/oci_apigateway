output "id" {
  description = "The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the resource."
  value       = oci_apigateway_certificate.this.id
}

output "certificate" {
  description = "The data of the leaf certificate in pem format."
  value       = oci_apigateway_certificate.this.certificate
}

output "compartment_id" {
  description = "The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment in which the resource is created."
  value       = oci_apigateway_certificate.this.compartment_id
}

output "defined_tags" {
  description = "Defined tags for this resource. Each key is predefined and scoped to a namespace. For more information, see [Resource Tags](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/resourcetags.htm).  Example: `{\"Operations.CostCenter\": \"42\"}`"
  value       = oci_apigateway_certificate.this.defined_tags
}

output "display_name" {
  description = "A user-friendly name. Does not have to be unique, and it's changeable. Avoid entering confidential information.  Example: `My new resource`"
  value       = oci_apigateway_certificate.this.display_name
}

output "freeform_tags" {
  description = "Free-form tags for this resource. Each tag is a simple key-value pair with no predefined name, type, or namespace. For more information, see [Resource Tags](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/resourcetags.htm).  Example: `{\"Department\": \"Finance\"}`"
  value       = oci_apigateway_certificate.this.freeform_tags
}

output "intermediate_certificates" {
  description = "The intermediate certificate data associated with the certificate in pem format."
  value       = oci_apigateway_certificate.this.intermediate_certificates
}

output "lifecycle_details" {
  description = "A message describing the current state in more detail. For example, can be used to provide actionable information for a resource in a Failed state."
  value       = oci_apigateway_certificate.this.lifecycle_details
}

output "state" {
  description = "The current state of the certificate."
  value       = oci_apigateway_certificate.this.state
}

output "subject_names" {
  description = "The entity to be secured by the certificate and additional host names."
  value       = oci_apigateway_certificate.this.subject_names
}

output "time_created" {
  description = "The time this resource was created. An RFC3339 formatted datetime string."
  value       = oci_apigateway_certificate.this.time_created
}

output "time_not_valid_after" {
  description = "The date and time the certificate will expire."
  value       = oci_apigateway_certificate.this.time_not_valid_after
}

output "time_updated" {
  description = "The time this resource was last updated. An RFC3339 formatted datetime string."
  value       = oci_apigateway_certificate.this.time_updated
}
