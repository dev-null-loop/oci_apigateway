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
      for_each = var.specification.logging_policies != null ? var.specification.logging_policies : []
      iterator = lp
      content {
        dynamic "access_log" {
          for_each = try(lp.value.access_log[*], [])
          iterator = al
          content {
            is_enabled = al.value.is_enabled
          }
        }
        dynamic "execution_log" {
          for_each = try(lp.value.execution_log[*], [])
          iterator = el
          content {
            is_enabled = el.value.is_enabled
            log_level  = el.value.log_level
          }
        }
      }
    }
    dynamic "request_policies" {
      for_each = var.specification.request_policies != null ? var.specification.request_policies : []
      iterator = rp
      content {
        dynamic "authentication" {
          for_each = try(rp.value.authentication[*], [])
          iterator = au
          content {
            audiences                   = try(au.value.audiences, null)
            cache_key                   = try(au.value.cache_key, null)
            function_id                 = try(au.value.function_id, null)
            is_anonymous_access_allowed = try(au.value.is_anonymous_access_allowed, null)
            issuers                     = try(au.value.issuers, null)
            max_clock_skew_in_seconds   = try(au.value.max_clock_skew_in_seconds, null)
            parameters                  = try(au.value.parameters, null)
            token_auth_scheme           = try(au.value.token_auth_scheme, null)
            token_header                = try(au.value.token_header, null)
            token_query_param           = try(au.value.token_query_param, null)
            type                        = au.value.type
            dynamic "public_keys" {
              for_each = try(au.value.public_keys, [])
              iterator = pk
              content {
                is_ssl_verify_disabled      = try(pk.value.is_ssl_verify_disabled, null)
                max_cache_duration_in_hours = try(pk.value.max_cache_duration_in_hours, null)
                type                        = pk.value.type
                uri                         = try(pk.value.uri, null)
                dynamic "keys" {
                  for_each = try(pk.value.keys, [])
                  iterator = ke
                  content {
                    alg     = try(ke.value.alg, null)
                    e       = try(ke.value.e, null)
                    format  = ke.value.format
                    key     = try(ke.value.key, null)
                    key_ops = try(ke.value.key_ops, null)
                    kid     = try(ke.value.kid, null)
                    kty     = try(ke.value.kty, null)
                    n       = try(ke.value.n, null)
                    use     = try(ke.value.use, null)
                  }
                }
              }
            }
            dynamic "validation_failure_policy" {
              for_each = try(au.value.validation_failure_policy[*], [])
              iterator = vfp
              content {
                fallback_redirect_path             = try(vfp.value.fallback_redirect_path, null)
                logout_path                        = try(vfp.value.logout_path, null)
                max_expiry_duration_in_hours       = try(vfp.value.max_expiry_duration_in_hours, null)
                response_code                      = try(vfp.value.response_code, null)
                response_message                   = try(vfp.value.response_message, null)
                response_type                      = try(vfp.value.response_type, null)
                scopes                             = try(vfp.value.scopes, null)
                type                               = vfp.value.type
                use_cookies_for_intermediate_steps = try(vfp.value.use_cookies_for_intermediate_steps, null)
                use_cookies_for_session            = try(vfp.value.use_cookies_for_session, null)
                use_pkce                           = try(vfp.value.use_pkce, null)
                dynamic "client_details" {
                  for_each = try(vfp.value.client_details[*], [])
                  iterator = cd
                  content {
                    client_id                    = try(cd.value.client_id, null)
                    client_secret_id             = try(cd.value.client_secret_id, null)
                    client_secret_version_number = try(cd.value.client_secret_version_number, null)
                    type                         = cd.value.type
                  }
                }
              }
            }
            dynamic "validation_policy" {
              for_each = try(au.value.validation_policy[*], [])
              iterator = vp
              content {
                is_ssl_verify_disabled      = try(vp.value.is_ssl_verify_disabled, null)
                max_cache_duration_in_hours = try(vp.value.max_cache_duration_in_hours, null)
                type                        = vp.value.type
                uri                         = try(vp.value.uri, null)
              }
            }
            dynamic "verify_claims" {
              for_each = try(au.value.verify_claims, [])
              iterator = vc
              content {
                is_required = try(vc.value.is_required, null)
                key         = vc.value.key
                values      = try(vc.value.values, null)
              }
            }
          }
        }
        dynamic "cors" {
          for_each = try(rp.value.cors[*], [])
          iterator = co
          content {
            allowed_headers              = try(co.value.allowed_headers, null)
            allowed_methods              = try(co.value.allowed_methods, null)
            allowed_origins              = co.value.allowed_origins
            exposed_headers              = try(co.value.exposed_headers, null)
            is_allow_credentials_enabled = try(co.value.is_allow_credentials_enabled, null)
            max_age_in_seconds           = try(co.value.max_age_in_seconds, null)
          }
        }
        dynamic "mutual_tls" {
          for_each = try(rp.value.mutual_tls[*], [])
          iterator = mt
          content {
            allowed_sans                     = try(mt.value.allowed_sans, null)
            is_verified_certificate_required = try(mt.value.is_verified_certificate_required, null)
          }
        }
        dynamic "rate_limiting" {
          for_each = try(rp.value.rate_limiting[*], [])
          iterator = rl
          content {
            rate_in_requests_per_second = rl.value.rate_in_requests_per_second
            rate_key                    = rl.value.rate_key
          }
        }
        dynamic "usage_plans" {
          for_each = try(rp.value.usage_plans[*], [])
          iterator = up
          content {
            token_locations = up.value.token_locations
          }
        }
      }
    }
    dynamic "routes" {
      for_each = var.specification.routes != null ? var.specification.routes : []
      iterator = ro
      content {
        methods = try(ro.value.methods, null)
        path    = ro.value.path
        dynamic "backend" {
          for_each = try(ro.value.backend[*], [])
          iterator = be
          content {
            type                       = be.value.type
            url                        = try(be.value.url, null)
            function_id                = try(be.value.function_id, null)
            body                       = try(be.value.body, null)
            status                     = try(be.value.status, null)
            connect_timeout_in_seconds = try(be.value.connect_timeout_in_seconds, null)
            read_timeout_in_seconds    = try(be.value.read_timeout_in_seconds, null)
            send_timeout_in_seconds    = try(be.value.send_timeout_in_seconds, null)
            is_ssl_verify_disabled     = try(be.value.is_ssl_verify_disabled, null)
            dynamic "headers" {
              for_each = try(be.value.headers, [])
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
