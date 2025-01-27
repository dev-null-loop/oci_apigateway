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
    request_policies {
      dynamic "authentication" {
        for_each = var.authentication[*]
        iterator = a
        content {
          type                        = a.value.type
          audiences                   = a.value.audiences
          cache_key                   = a.value.cache_key
          function_id                 = a.value.function_id
          is_anonymous_access_allowed = a.value.is_anonymous_access_allowed
          issuers                     = a.value.issuers
          max_clock_skew_in_seconds   = a.value.max_clock_skew_in_seconds
          parameters                  = a.value.parameters
          dynamic "public_keys" {
            for_each = a.value.public_keys
            iterator = pk
            content {
              type                   = pk.value.type
              is_ssl_verify_disabled = pk.value.is_ssl_verify_disabled
              keys {
                format  = pk.value.format
                alg     = pk.value.alg
                e       = pk.value.e
                key     = pk.value.key
                key_ops = pk.value.key_ops
                kid     = pk.value.kid
                kty     = pk.value.kty
                n       = pk.value.n
                use     = pk.value.use
              }
              max_cache_duration_in_hours = pk.value.max_cache_duration_in_hours
              uri                         = pk.value.uri
            }
          }
          token_auth_scheme = a.value.token_auth_scheme
          token_header      = a.value.token_header
          token_query_param = a.value.token_query_param
          #	validation_failure_policy {
          #	  #Required
          #	  type = var.deployment_specification_request_policies_authentication_validation_failure_policy_type

          #	  #Optional
          #	  client_details {
          #	    #Required
          #	    type = var.deployment_specification_request_policies_authentication_validation_failure_policy_client_details_type

          #	    #Optional
          #	    client_id                    = oci_apigateway_client.test_client.id
          #	    client_secret_id             = oci_vault_secret.test_secret.id
          #	    client_secret_version_number = var.deployment_specification_request_policies_authentication_validation_failure_policy_client_details_client_secret_version_number
          #	  }
          #	  fallback_redirect_path       = var.deployment_specification_request_policies_authentication_validation_failure_policy_fallback_redirect_path
          #	  logout_path                  = var.deployment_specification_request_policies_authentication_validation_failure_policy_logout_path
          #	  max_expiry_duration_in_hours = var.deployment_specification_request_policies_authentication_validation_failure_policy_max_expiry_duration_in_hours
          #	  response_code                = var.deployment_specification_request_policies_authentication_validation_failure_policy_response_code
          #	  response_header_transformations {

          #	    #Optional
          #	    filter_headers {

          #	      #Optional
          #	      items {

          #		#Optional
          #		name = var.deployment_specification_request_policies_authentication_validation_failure_policy_response_header_transformations_filter_headers_items_name
          #	      }
          #	      type = var.deployment_specification_request_policies_authentication_validation_failure_policy_response_header_transformations_filter_headers_type
          #	    }
          #	    rename_headers {

          #	      #Optional
          #	      items {

          #		#Optional
          #		from = var.deployment_specification_request_policies_authentication_validation_failure_policy_response_header_transformations_rename_headers_items_from
          #		to   = var.deployment_specification_request_policies_authentication_validation_failure_policy_response_header_transformations_rename_headers_items_to
          #	      }
          #	    }
          #	    set_headers {

          #	      #Optional
          #	      items {

          #		#Optional
          #		if_exists = var.deployment_specification_request_policies_authentication_validation_failure_policy_response_header_transformations_set_headers_items_if_exists
          #		name      = var.deployment_specification_request_policies_authentication_validation_failure_policy_response_header_transformations_set_headers_items_name
          #		values    = var.deployment_specification_request_policies_authentication_validation_failure_policy_response_header_transformations_set_headers_items_values
          #	      }
          #	    }
          #	  }
          #	  response_message = var.deployment_specification_request_policies_authentication_validation_failure_policy_response_message
          #	  response_type    = var.deployment_specification_request_policies_authentication_validation_failure_policy_response_type
          #	  scopes           = var.deployment_specification_request_policies_authentication_validation_failure_policy_scopes
          #	  source_uri_details {
          #	    #Required
          #	    type = var.deployment_specification_request_policies_authentication_validation_failure_policy_source_uri_details_type

          #	    #Optional
          #	    uri = var.deployment_specification_request_policies_authentication_validation_failure_policy_source_uri_details_uri
          #	  }
          #	  use_cookies_for_intermediate_steps = var.deployment_specification_request_policies_authentication_validation_failure_policy_use_cookies_for_intermediate_steps
          #	  use_cookies_for_session            = var.deployment_specification_request_policies_authentication_validation_failure_policy_use_cookies_for_session
          #	  use_pkce                           = var.deployment_specification_request_policies_authentication_validation_failure_policy_use_pkce
          #	}
          #	validation_policy {
          #	  #Required
          #	  type = var.deployment_specification_request_policies_authentication_validation_policy_type

          #	  #Optional
          #	  additional_validation_policy {

          #	    #Optional
          #	    audiences = var.deployment_specification_request_policies_authentication_validation_policy_additional_validation_policy_audiences
          #	    issuers   = var.deployment_specification_request_policies_authentication_validation_policy_additional_validation_policy_issuers
          #	    verify_claims {

          #	      #Optional
          #	      is_required = var.deployment_specification_request_policies_authentication_validation_policy_additional_validation_policy_verify_claims_is_required
          #	      key         = var.deployment_specification_request_policies_authentication_validation_policy_additional_validation_policy_verify_claims_key
          #	      values      = var.deployment_specification_request_policies_authentication_validation_policy_additional_validation_policy_verify_claims_values
          #	    }
          #	  }
          #	  client_details {
          #	    #Required
          #	    type = var.deployment_specification_request_policies_authentication_validation_policy_client_details_type

          #	    #Optional
          #	    client_id                    = oci_apigateway_client.test_client.id
          #	    client_secret_id             = oci_vault_secret.test_secret.id
          #	    client_secret_version_number = var.deployment_specification_request_policies_authentication_validation_policy_client_details_client_secret_version_number
          #	  }
          #	  is_ssl_verify_disabled = var.deployment_specification_request_policies_authentication_validation_policy_is_ssl_verify_disabled
          #	  keys {
          #	    #Required
          #	    format = var.deployment_specification_request_policies_authentication_validation_policy_keys_format

          #	    #Optional
          #	    alg     = var.deployment_specification_request_policies_authentication_validation_policy_keys_alg
          #	    e       = var.deployment_specification_request_policies_authentication_validation_policy_keys_e
          #	    key     = var.deployment_specification_request_policies_authentication_validation_policy_keys_key
          #	    key_ops = var.deployment_specification_request_policies_authentication_validation_policy_keys_key_ops
          #	    kid     = var.deployment_specification_request_policies_authentication_validation_policy_keys_kid
          #	    kty     = var.deployment_specification_request_policies_authentication_validation_policy_keys_kty
          #	    n       = var.deployment_specification_request_policies_authentication_validation_policy_keys_n
          #	    use     = var.deployment_specification_request_policies_authentication_validation_policy_keys_use
          #	  }
          #	  max_cache_duration_in_hours = var.deployment_specification_request_policies_authentication_validation_policy_max_cache_duration_in_hours
          #	  source_uri_details {
          #	    #Required
          #	    type = var.deployment_specification_request_policies_authentication_validation_policy_source_uri_details_type

          #	    #Optional
          #	    uri = var.deployment_specification_request_policies_authentication_validation_policy_source_uri_details_uri
          #	  }
          #	  uri = var.deployment_specification_request_policies_authentication_validation_policy_uri
          #	}
          #	verify_claims {

          #	  #Optional
          #	  is_required = var.deployment_specification_request_policies_authentication_verify_claims_is_required
          #	  key         = var.deployment_specification_request_policies_authentication_verify_claims_key
          #	  values      = var.deployment_specification_request_policies_authentication_verify_claims_values
          #	}
          # }
          # cors {
          #	#Required
          #	allowed_origins = var.deployment_specification_request_policies_cors_allowed_origins

          #	#Optional
          #	allowed_headers              = var.deployment_specification_request_policies_cors_allowed_headers
          #	allowed_methods              = var.deployment_specification_request_policies_cors_allowed_methods
          #	exposed_headers              = var.deployment_specification_request_policies_cors_exposed_headers
          #	is_allow_credentials_enabled = var.deployment_specification_request_policies_cors_is_allow_credentials_enabled
          #	max_age_in_seconds           = var.deployment_specification_request_policies_cors_max_age_in_seconds
          # }
          # dynamic_authentication {
          #	#Required
          #	authentication_servers {
          #	  #Required
          #	  authentication_server_detail {
          #	    #Required
          #	    type = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_type

          #	    #Optional
          #	    audiences                   = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_audiences
          #	    function_id                 = oci_functions_function.test_function.id
          #	    is_anonymous_access_allowed = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_is_anonymous_access_allowed
          #	    issuers                     = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_issuers
          #	    max_clock_skew_in_seconds   = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_max_clock_skew_in_seconds
          #	    public_keys {
          #	      #Required
          #	      type = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_public_keys_type

          #	      #Optional
          #	      is_ssl_verify_disabled = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_public_keys_is_ssl_verify_disabled
          #	      keys {
          #		#Required
          #		format = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_public_keys_keys_format

          #		#Optional
          #		alg     = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_public_keys_keys_alg
          #		e       = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_public_keys_keys_e
          #		key     = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_public_keys_keys_key
          #		key_ops = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_public_keys_keys_key_ops
          #		kid     = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_public_keys_keys_kid
          #		kty     = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_public_keys_keys_kty
          #		n       = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_public_keys_keys_n
          #		use     = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_public_keys_keys_use
          #	      }
          #	      max_cache_duration_in_hours = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_public_keys_max_cache_duration_in_hours
          #	      uri                         = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_public_keys_uri
          #	    }
          #	    token_auth_scheme = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_token_auth_scheme
          #	    token_header      = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_token_header
          #	    token_query_param = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_token_query_param
          #	    validation_failure_policy {
          #	      #Required
          #	      type = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_validation_failure_policy_type

          #	      #Optional
          #	      client_details {
          #		#Required
          #		type = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_validation_failure_policy_client_details_type

          #		#Optional
          #		client_id                    = oci_apigateway_client.test_client.id
          #		client_secret_id             = oci_vault_secret.test_secret.id
          #		client_secret_version_number = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_validation_failure_policy_client_details_client_secret_version_number
          #	      }
          #	      fallback_redirect_path       = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_validation_failure_policy_fallback_redirect_path
          #	      logout_path                  = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_validation_failure_policy_logout_path
          #	      max_expiry_duration_in_hours = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_validation_failure_policy_max_expiry_duration_in_hours
          #	      response_code                = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_validation_failure_policy_response_code
          #	      response_header_transformations {

          #		#Optional
          #		filter_headers {

          #		  #Optional
          #		  items {

          #		    #Optional
          #		    name = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_validation_failure_policy_response_header_transformations_filter_headers_items_name
          #		  }
          #		  type = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_validation_failure_policy_response_header_transformations_filter_headers_type
          #		}
          #		rename_headers {

          #		  #Optional
          #		  items {

          #		    #Optional
          #		    from = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_validation_failure_policy_response_header_transformations_rename_headers_items_from
          #		    to   = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_validation_failure_policy_response_header_transformations_rename_headers_items_to
          #		  }
          #		}
          #		set_headers {

          #		  #Optional
          #		  items {

          #		    #Optional
          #		    if_exists = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_validation_failure_policy_response_header_transformations_set_headers_items_if_exists
          #		    name      = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_validation_failure_policy_response_header_transformations_set_headers_items_name
          #		    values    = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_validation_failure_policy_response_header_transformations_set_headers_items_values
          #		  }
          #		}
          #	      }
          #	      response_message = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_validation_failure_policy_response_message
          #	      response_type    = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_validation_failure_policy_response_type
          #	      scopes           = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_validation_failure_policy_scopes
          #	      source_uri_details {
          #		#Required
          #		type = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_validation_failure_policy_source_uri_details_type

          #		#Optional
          #		uri = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_validation_failure_policy_source_uri_details_uri
          #	      }
          #	      use_cookies_for_intermediate_steps = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_validation_failure_policy_use_cookies_for_intermediate_steps
          #	      use_cookies_for_session            = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_validation_failure_policy_use_cookies_for_session
          #	      use_pkce                           = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_validation_failure_policy_use_pkce
          #	    }
          #	    validation_policy {
          #	      #Required
          #	      type = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_validation_policy_type

          #	      #Optional
          #	      additional_validation_policy {

          #		#Optional
          #		audiences = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_validation_policy_additional_validation_policy_audiences
          #		issuers   = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_validation_policy_additional_validation_policy_issuers
          #		verify_claims {

          #		  #Optional
          #		  is_required = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_validation_policy_additional_validation_policy_verify_claims_is_required
          #		  key         = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_validation_policy_additional_validation_policy_verify_claims_key
          #		  values      = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_validation_policy_additional_validation_policy_verify_claims_values
          #		}
          #	      }
          #	      client_details {
          #		#Required
          #		type = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_validation_policy_client_details_type

          #		#Optional
          #		client_id                    = oci_apigateway_client.test_client.id
          #		client_secret_id             = oci_vault_secret.test_secret.id
          #		client_secret_version_number = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_validation_policy_client_details_client_secret_version_number
          #	      }
          #	      is_ssl_verify_disabled = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_validation_policy_is_ssl_verify_disabled
          #	      keys {
          #		#Required
          #		format = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_validation_policy_keys_format

          #		#Optional
          #		alg     = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_validation_policy_keys_alg
          #		e       = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_validation_policy_keys_e
          #		key     = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_validation_policy_keys_key
          #		key_ops = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_validation_policy_keys_key_ops
          #		kid     = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_validation_policy_keys_kid
          #		kty     = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_validation_policy_keys_kty
          #		n       = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_validation_policy_keys_n
          #		use     = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_validation_policy_keys_use
          #	      }
          #	      max_cache_duration_in_hours = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_validation_policy_max_cache_duration_in_hours
          #	      source_uri_details {
          #		#Required
          #		type = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_validation_policy_source_uri_details_type

          #		#Optional
          #		uri = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_validation_policy_source_uri_details_uri
          #	      }
          #	      uri = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_validation_policy_uri
          #	    }
          #	    verify_claims {

          #	      #Optional
          #	      is_required = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_verify_claims_is_required
          #	      key         = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_verify_claims_key
          #	      values      = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_verify_claims_values
          #	    }
          #	  }
          #	  key {
          #	    #Required
          #	    name = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_key_name

          #	    #Optional
          #	    expression = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_key_expression
          #	    is_default = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_key_is_default
          #	    type       = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_key_type
          #	    values     = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_key_values
          #	  }
          #	}
          #	selection_source {
          #	  #Required
          #	  selector = var.deployment_specification_request_policies_dynamic_authentication_selection_source_selector
          #	  type     = var.deployment_specification_request_policies_dynamic_authentication_selection_source_type
          #	}
          # }
          # mutual_tls {

          #	#Optional
          #	allowed_sans                     = var.deployment_specification_request_policies_mutual_tls_allowed_sans
          #	is_verified_certificate_required = var.deployment_specification_request_policies_mutual_tls_is_verified_certificate_required
          # }
          # rate_limiting {
          #	#Required
          #	rate_in_requests_per_second = var.deployment_specification_request_policies_rate_limiting_rate_in_requests_per_second
          #	rate_key                    = var.deployment_specification_request_policies_rate_limiting_rate_key
          # }
          # usage_plans {
          #	#Required
          #	token_locations = var.deployment_specification_request_policies_usage_plans_token_locations
          # }

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
