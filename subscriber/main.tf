resource "oci_apigateway_subscriber" "this" {
  dynamic "clients" {
    for_each = var.clients
    iterator = cl
    content {
      name  = cl.value.name
      token = cl.value.token
    }
  }
  compartment_id = var.compartment_id
  usage_plans    = var.usage_plans
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
