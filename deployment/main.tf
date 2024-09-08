resource "oci_apigateway_deployment" "this" {
  compartment_id = var.compartment_id
  defined_tags   = var.defined_tags
  display_name   = var.display_name
  freeform_tags  = var.freeform_tags
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
	    dynamic "body_validation" {
	      for_each = rp.value.body_validation[*]
	      iterator = bv
	      content {
		dynamic "content" {
		  for_each = bv.value.content[*]
		  iterator = c
		  content {
		    media_type      = c.value.media_type
		    validation_type = c.valuevalidation_type
		  }
		}
		required        = bv.value.required
		validation_mode = bv.valuevalidation_mode
	      }
	    }
	    dynamic "cors" {
	      for_each = rp.value.cors[*]
	      iterator = c
	      content {
		allowed_origins              = c.value.allowed_origins
		allowed_headers              = c.value.allowed_headers
		allowed_methods              = c.value.allowed_methods
		exposed_headers              = c.value.exposed_headers
		is_allow_credentials_enabled = c.value.is_allow_credentials_enabled
		max_age_in_seconds           = c.value.max_age_in_seconds
	      }
	    }
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
		    type = fh.value.type
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
	    dynamic "header_validations" {
	      for_each = rp.value.header_validations[*]
	      iterator = hv
	      content {
		dynamic "headers" {
		  for_each = hv.value.headers[*]
		  iterator = h
		  content {
		    name     = h.value.name
		    required = h.value.required
		  }
		}
		validation_mode = hv.value.validation_mode
	      }
	    }
	    dynamic "query_parameter_transformations" {
	      for_each = rp.value.query_parameter_transformations[*]
	      iterator = qpt
	      content {
		dynamic "filter_query_parameters" {
		  for_each = qpt.value.filter_query_parameters
		  iterator = fqp
		  content {
		    items {
		      name = fqp.name
		    }
		    type = qpt.type
		  }
		}
		dynamic "rename_query_parameters" {
		  for_each = qpt.value.rename_query_parameters[*]
		  iterator = rqp
		  content {
		    items {
		      from = rqp.value.from
		      to   = rqp.value.to
		    }
		  }
		}
		dynamic "set_query_parameters" {
		  for_each = qpt.value.set_query_parameters[*]
		  iterator = sqp
		  content {
		    items {
		      name      = sqp.value.name
		      values    = sqp.value.values
		      if_exists = sqp.value.if_exists
		    }
		  }
		}
	      }
	    }
	    dynamic "query_parameter_validations" {
	      for_each = rp.value.query_parameter_validations[*]
	      iterator = qpv
	      content {
		parameters {
		  name     = qpv.value.name
		  required = qpv.value.required
		}
		validation_mode = qpv.value.validation_mode
	      }
	    }
	    dynamic "response_cache_lookup" {
	      for_each = rp.value.response_cache_lookup[*]
	      iterator = rcl
	      content {
		type                       = rcl.value.type
		cache_key_additions        = rcl.value.cache_key_additions
		is_enabled                 = rcl.value.is_enabled
		is_private_caching_enabled = rcl.value.is_private_caching_enabled
	      }
	    }
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
}
