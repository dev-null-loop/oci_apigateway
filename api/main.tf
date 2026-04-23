resource "oci_apigateway_api" "this" {
  compartment_id = var.compartment_id
  content        = var.content
  defined_tags   = var.defined_tags
  display_name   = var.display_name
  freeform_tags  = var.freeform_tags
  dynamic "locks" {
    for_each = var.locks != null ? var.locks : []
    iterator = lo
    content {
      type    = lo.value.type
      message = lo.value.message
    }
  }
}
