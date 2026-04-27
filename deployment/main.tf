resource "oci_apigateway_deployment" "this" {
  compartment_id = var.compartment_id
  defined_tags   = var.defined_tags
  display_name   = var.display_name
  freeform_tags  = var.freeform_tags
  gateway_id     = var.gateway_id
  path_prefix    = var.path_prefix
  dynamic "locks" {
    for_each = var.locks != null ? var.locks : []
    iterator = lo
    content {
      message = lo.value.message
      type    = lo.value.type
    }
  }
  specification {
    dynamic "logging_policies" {
      for_each = var.specification.logging_policies[*]
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
    dynamic "request_policies" {
      for_each = var.specification.request_policies[*]
      iterator = rp
      content {
        dynamic "authentication" {
          for_each = rp.value.authentication[*]
          iterator = au
          content {
            audiences                   = au.value.audiences
            cache_key                   = au.value.cache_key
            function_id                 = au.value.function_id
            is_anonymous_access_allowed = au.value.is_anonymous_access_allowed
            issuers                     = au.value.issuers
            max_clock_skew_in_seconds   = au.value.max_clock_skew_in_seconds
            parameters                  = au.value.parameters
            token_auth_scheme           = au.value.token_auth_scheme
            token_header                = au.value.token_header
            token_query_param           = au.value.token_query_param
            type                        = au.value.type
            dynamic "public_keys" {
              for_each = au.value.public_keys[*]
              iterator = pk
              content {
                is_ssl_verify_disabled      = pk.value.is_ssl_verify_disabled
                max_cache_duration_in_hours = pk.value.max_cache_duration_in_hours
                type                        = pk.value.type
                uri                         = pk.value.uri
                dynamic "keys" {
                  for_each = pk.value.keys
                  iterator = ke
                  content {
                    alg     = ke.value.alg
                    e       = ke.value.e
                    format  = ke.value.format
                    key     = ke.value.key
                    key_ops = ke.value.key_ops
                    kid     = ke.value.kid
                    kty     = ke.value.kty
                    n       = ke.value.n
                    use     = ke.value.use
                  }
                }
              }
            }
            dynamic "validation_failure_policy" {
              for_each = au.value.validation_failure_policy[*]
              iterator = vfp
              content {
                fallback_redirect_path             = vfp.value.fallback_redirect_path
                logout_path                        = vfp.value.logout_path
                max_expiry_duration_in_hours       = vfp.value.max_expiry_duration_in_hours
                response_code                      = vfp.value.response_code
                response_message                   = vfp.value.response_message
                response_type                      = vfp.value.response_type
                scopes                             = vfp.value.scopes
                type                               = vfp.value.type
                use_cookies_for_intermediate_steps = vfp.value.use_cookies_for_intermediate_steps
                use_cookies_for_session            = vfp.value.use_cookies_for_session
                use_pkce                           = vfp.value.use_pkce
                dynamic "client_details" {
                  for_each = vfp.value.client_details[*]
                  iterator = cd
                  content {
                    client_id                    = cd.value.client_id
                    client_secret_id             = cd.value.client_secret_id
                    client_secret_version_number = cd.value.client_secret_version_number
                    type                         = cd.value.type
                  }
                }
              }
            }
            dynamic "validation_policy" {
              for_each = au.value.validation_policy[*]
              iterator = vp
              content {
                is_ssl_verify_disabled      = vp.value.is_ssl_verify_disabled
                max_cache_duration_in_hours = vp.value.max_cache_duration_in_hours
                type                        = vp.value.type
                uri                         = vp.value.uri
              }
            }
            dynamic "verify_claims" {
              for_each = au.value.verify_claims
              iterator = vc
              content {
                is_required = vc.value.is_required
                key         = vc.value.key
                values      = vc.value.values
              }
            }
          }
        }
        dynamic "cors" {
          for_each = rp.value.cors[*]
          iterator = co
          content {
            allowed_headers              = co.value.allowed_headers
            allowed_methods              = co.value.allowed_methods
            allowed_origins              = co.value.allowed_origins
            exposed_headers              = co.value.exposed_headers
            is_allow_credentials_enabled = co.value.is_allow_credentials_enabled
            max_age_in_seconds           = co.value.max_age_in_seconds
          }
        }
        dynamic "mutual_tls" {
          for_each = rp.value.mutual_tls[*]
          iterator = mt
          content {
            allowed_sans                     = mt.value.allowed_sans
            is_verified_certificate_required = mt.value.is_verified_certificate_required
          }
        }
        dynamic "rate_limiting" {
          for_each = rp.value.rate_limiting[*]
          iterator = rl
          content {
            rate_in_requests_per_second = rl.value.rate_in_requests_per_second
            rate_key                    = rl.value.rate_key
          }
        }
        dynamic "usage_plans" {
          for_each = rp.value.usage_plans[*]
          iterator = up
          content {
            token_locations = up.value.token_locations
          }
        }
      }
    }
    dynamic "routes" {
      for_each = var.specification.routes
      iterator = ro
      content {
        methods = ro.value.methods
        path    = ro.value.path
        dynamic "backend" {
          for_each = ro.value.backend[*]
          iterator = be
          content {
            type                       = be.value.type
            url                        = be.value.url
            function_id                = be.value.function_id
            body                       = be.value.body
            status                     = be.value.status
            connect_timeout_in_seconds = be.value.connect_timeout_in_seconds
            read_timeout_in_seconds    = be.value.read_timeout_in_seconds
            send_timeout_in_seconds    = be.value.send_timeout_in_seconds
            is_ssl_verify_disabled     = be.value.is_ssl_verify_disabled
            dynamic "headers" {
              for_each = be.value.headers
              iterator = he
              content {
                name  = he.value.name
                value = he.value.value
              }
            }
          }
        }
      }
    }
  }
}
