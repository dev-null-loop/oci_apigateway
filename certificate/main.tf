resource "oci_apigateway_certificate" "this" {
  certificate               = var.certificate
  compartment_id            = var.compartment_id
  private_key               = var.private_key
  defined_tags              = var.defined_tags
  display_name              = var.display_name
  freeform_tags             = var.freeform_tags
  intermediate_certificates = var.intermediate_certificates
}
