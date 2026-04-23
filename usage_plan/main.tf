resource "oci_apigateway_usage_plan" "this" {
  compartment_id = var.compartment_id
  defined_tags   = var.defined_tags
  display_name   = var.display_name
  freeform_tags  = var.freeform_tags
  dynamic "entitlements" {
    for_each = var.entitlements
    iterator = en
    content {
      name        = en.value.name
      description = en.value.description
      dynamic "quota" {
        for_each = en.value.quota[*]
        iterator = qu
        content {
          operation_on_breach = qu.value.operation_on_breach
          reset_policy        = qu.value.reset_policy
          unit                = qu.value.unit
          value               = qu.value.value
        }
      }
      dynamic "rate_limit" {
        for_each = en.value.rate_limit[*]
        iterator = rl
        content {
          unit  = rl.value.unit
          value = rl.value.value
        }
      }
      dynamic "targets" {
        for_each = en.value.targets != null ? en.value.targets : []
        iterator = ta
        content {
          deployment_id = ta.value.deployment_id
        }
      }
    }
  }
  dynamic "locks" {
    for_each = var.locks != null ? var.locks : []
    iterator = lo
    content {
      type    = lo.value.type
      message = lo.value.message
    }
  }
}
