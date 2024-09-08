resource "oci_apigateway_gateway" "this" {
  compartment_id = var.compartment_id
  endpoint_type  = var.endpoint_type
  subnet_id      = var.subnet_id
  certificate_id = var.certificate_id
  dynamic "ca_bundles" {
    for_each = var.ca_bundles[*]
    iterator = cab
    content {
      type                     = cab.value.type
      ca_bundle_id             = cab.value.ca_bundle_id
      certificate_authority_id = cab.value.certificate_authority_id
    }
  }
  defined_tags               = var.defined_tags
  display_name               = var.display_name
  freeform_tags              = var.freeform_tags
  network_security_group_ids = var.network_security_group_ids
  dynamic "response_cache_details" {
    for_each = var.response_cache_details[*]
    iterator = rcd
    content {
      type                                 = rcd.value.type
      authentication_secret_id             = rcd.value.authentication_secret_id
      authentication_secret_version_number = rcd.value.authentication_secret_version_number
      connect_timeout_in_ms                = rcd.value.connect_timeout_in_ms
      is_ssl_enabled                       = rcd.value.is_ssl_enabled
      is_ssl_verify_disabled               = rcd.value.is_ssl_verify_disabled
      read_timeout_in_ms                   = rcd.value.read_timeout_in_ms
      send_timeout_in_ms                   = rcd.value.send_timeout_in_ms
      servers {
        host = rcd.value.servers.host
        port = rcd.value.servers.port
      }
    }
  }
}
