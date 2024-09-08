resource "oci_apigateway_deployment" "this" {
  compartment_id = var.compartment_id
  gateway_id     = var.gateway_id
  path_prefix    = var.path_prefix
  specification {
    dynamic "logging_policies" {
      for_each = var.logging_policies[*]
      iterator = lp
      content {
	dynamic "access_log" {
	  for_each = lp.value.access_log[*]
	  iterator = al
	  content {
	    is_enabled = al.value.is_enabled
	  }
	}
	dynamic "execution_log" {
	  for_each = lp.value.execution_log[*]
	  iterator = el
	  content {
	    is_enabled = el.value.is_enabled
	    log_level  = el.value.log_level
	  }
	}
      }
    }

    dynamic "routes" {
      for_each = var.routes != null ? var.routes : []
      iterator = r
      content {
	backend {
	  type                       = r.value.backend.type
	  allowed_post_logout_uris   = r.value.backend.allowed_post_logout_uris
	  body                       = r.value.backend.body
	  connect_timeout_in_seconds = r.value.backend.connect_timeout_in_seconds
	  function_id                = r.value.backend.function_id
	  dynamic "headers" {
	    for_each = r.value.backend.headers[*]
	    iterator = h
	    content {
	      name  = h.value.name
	      value = h.value.value
	    }
	  }
	  is_ssl_verify_disabled  = r.value.backend.is_ssl_verify_disabled
	  post_logout_state       = r.value.backend.post_logout_state
	  read_timeout_in_seconds = r.value.backend.read_timeout_in_seconds
	  dynamic "routing_backends" {
	    for_each = r.value.backend.routing_backends[*]
	    iterator = rb
	    content {
	      backend {
		type                       = rb.value.type
		body                       = rb.value.body
		connect_timeout_in_seconds = rb.value.connect_timeout_in_seconds
		function_id                = rb.value.function_id
		headers {
		  name  = rb.value.headers.name
		  value = rb.value.headers.value
		}
		is_ssl_verify_disabled  = rb.value.is_ssl_verify_disabled
		read_timeout_in_seconds = rb.value.read_timeout_in_seconds
		send_timeout_in_seconds = rb.value.send_timeout_in_seconds
		status                  = rb.value.status
		url                     = rb.value.url
	      }
	      key {
		name       = rb.value.key.name
		type       = rb.value.key.type
		expression = rb.value.key.expression
		is_default = rb.value.key.is_default
		values     = rb.value.key.values
	      }
	    }
	  }
	  dynamic "selection_source" {
	    for_each = r.value.backend.selection_source[*]
	    iterator = ss
	    content {
	      selector = ss.value.selector
	      type     = ss.value.type
	    }
	  }
	  send_timeout_in_seconds = r.value.backend.send_timeout_in_seconds
	  status                  = r.value.backend.status
	  url                     = r.value.backend.url
	}
	dynamic "logging_policies" {
	  for_each = r.value.logging_policies[*]
	  iterator = lp
	  content {
	    dynamic "access_log" {
	      for_each = lp.value.access_log[*]
	      iterator = al
	      content {
		is_enabled = al.value.is_enabled
	      }
	    }
	    dynamic "execution_log" {
	      for_each = lp.value.execution_log[*]
	      iterator = el
	      content {
		is_enabled = el.value.is_enabled
		log_level  = el.value.log_level
	      }
	    }
	  }
	}
	methods = r.value.methods
	path    = r.value.path
	dynamic "request_policies" {
	  for_each = r.value.request_policies[*]
	  iterator = rp
	  content {
	    dynamic "authorization" {
	      for_each = rp.value.authorization[*]
	      iterator = au
	      content {
		allowed_scope = a.value.allowed_scope
		type          = a.value.type
	      }
	    }
	    # body_validation {
	    #   content {
	    #     media_type      = var.deployment_specification_routes_request_policies_body_validation_content_media_type
	    #     validation_type = var.deployment_specification_routes_request_policies_body_validation_content_validation_type
	    #   }

	    #   required        = var.deployment_specification_routes_request_policies_body_validation_required
	    #   validation_mode = var.deployment_specification_routes_request_policies_body_validation_validation_mode
	    # }
	    # cors {
	    #   allowed_origins              = var.deployment_specification_routes_request_policies_cors_allowed_origins
	    #   allowed_headers              = var.deployment_specification_routes_request_policies_cors_allowed_headers
	    #   allowed_methods              = var.deployment_specification_routes_request_policies_cors_allowed_methods
	    #   exposed_headers              = var.deployment_specification_routes_request_policies_cors_exposed_headers
	    #   is_allow_credentials_enabled = var.deployment_specification_routes_request_policies_cors_is_allow_credentials_enabled
	    #   max_age_in_seconds           = var.deployment_specification_routes_request_policies_cors_max_age_in_seconds
	    # }

	    # header_transformations {
	    #   filter_headers {
	    #     items {
	    #	name = var.deployment_specification_routes_request_policies_header_transformations_filter_headers_items_name
	    #     }
	    #     type = var.deployment_specification_routes_request_policies_header_transformations_filter_headers_type
	    #   }
	    #   rename_headers {
	    #     items {
	    #	from = var.deployment_specification_routes_request_policies_header_transformations_rename_headers_items_from
	    #	to   = var.deployment_specification_routes_request_policies_header_transformations_rename_headers_items_to
	    #     }
	    #   }
	    #   set_headers {
	    #     items {
	    #	name      = var.deployment_specification_routes_request_policies_header_transformations_set_headers_items_name
	    #	values    = var.deployment_specification_routes_request_policies_header_transformations_set_headers_items_values
	    #	if_exists = var.deployment_specification_routes_request_policies_header_transformations_set_headers_items_if_exists
	    #     }
	    #   }
	    # }
	    # header_validations {
	    #   headers {
	    #     name     = var.deployment_specification_routes_request_policies_header_validations_headers_name
	    #     required = var.deployment_specification_routes_request_policies_header_validations_headers_required
	    #   }
	    #   validation_mode = var.deployment_specification_routes_request_policies_header_validations_validation_mode
	    # }
	    # query_parameter_transformations {
	    #   filter_query_parameters {
	    #     items {
	    #	name = var.deployment_specification_routes_request_policies_query_parameter_transformations_filter_query_parameters_items_name
	    #     }
	    #     type = var.deployment_specification_routes_request_policies_query_parameter_transformations_filter_query_parameters_type
	    #   }
	    #   rename_query_parameters {
	    #     items {
	    #	from = var.deployment_specification_routes_request_policies_query_parameter_transformations_rename_query_parameters_items_from
	    #	to   = var.deployment_specification_routes_request_policies_query_parameter_transformations_rename_query_parameters_items_to
	    #     }
	    #   }
	    #   set_query_parameters {
	    #     items {
	    #	name      = var.deployment_specification_routes_request_policies_query_parameter_transformations_set_query_parameters_items_name
	    #	values    = var.deployment_specification_routes_request_policies_query_parameter_transformations_set_query_parameters_items_values
	    #	if_exists = var.deployment_specification_routes_request_policies_query_parameter_transformations_set_query_parameters_items_if_exists
	    #     }
	    #   }
	    # }
	    # query_parameter_validations {
	    #   parameters {
	    #     name     = var.deployment_specification_routes_request_policies_query_parameter_validations_parameters_name
	    #     required = var.deployment_specification_routes_request_policies_query_parameter_validations_parameters_required
	    #   }
	    #   validation_mode = var.deployment_specification_routes_request_policies_query_parameter_validations_validation_mode
	    # }
	    # response_cache_lookup {
	    #   type                       = var.deployment_specification_routes_request_policies_response_cache_lookup_type
	    #   cache_key_additions        = var.deployment_specification_routes_request_policies_response_cache_lookup_cache_key_additions
	    #   is_enabled                 = var.deployment_specification_routes_request_policies_response_cache_lookup_is_enabled
	    #   is_private_caching_enabled = var.deployment_specification_routes_request_policies_response_cache_lookup_is_private_caching_enabled
	    # }
	  }
	}
	dynamic "response_policies" {
	  for_each = r.value.response_policies[*]
	  iterator = rp
	  content {
	    dynamic "header_transformations" {
	      for_each = rp.value.header_transformations[*]
	      iterator = ht
	      content {
		dynamic "filter_headers" {
		  for_each = ht.value.filter_headers[*]
		  iterator = fh
		  content {
		    items {
		      name = fh.value.name
		    }
		    type = vht.value.type
		  }
		}
		dynamic "rename_headers" {
		  for_each = ht.value.rename_headers[*]
		  iterator = rh
		  content {
		    items {
		      from = rh.value.from
		      to   = rh.value.to
		    }
		  }
		}
		dynamic "set_headers" {
		  for_each = ht.value.set_headers[*]
		  iterator = sh
		  content {
		    items {
		      name      = sh.value.name
		      values    = sh.value.values
		      if_exists = sh.value.if_exists
		    }
		  }
		}
	      }
	    }
	    dynamic "response_cache_store" {
	      for_each = rp.value.response_cache_store[*]
	      iterator = rcs
	      content {
		time_to_live_in_seconds = rcs.value.time_to_live_in_seconds
		type                    = rcs.value.type
	      }
	    }
	  }
	}
      }
    }
  }
  defined_tags  = var.defined_tags
  display_name  = var.display_name
  freeform_tags = var.freeform_tags
}
