variable "compartment_id" {
  description = "(Required) (Updatable) The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment in which the resource is created."
  type        = string
}

variable "defined_tags" {
  description = "(Optional) (Updatable) Defined tags for this resource. Each key is predefined and scoped to a namespace. For more information, see [Resource Tags](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/resourcetags.htm)."
  type        = map(string)
  default     = null
}

variable "display_name" {
  description = "(Optional) (Updatable) A user-friendly name. Does not have to be unique, and it's changeable. Avoid entering confidential information.  Example: `My new resource`"
  type        = string
  default     = "deployment"
}

variable "freeform_tags" {
  description = "(Optional) (Updatable) Free-form tags for this resource. Each tag is a simple key-value pair with no predefined name, type, or namespace. For more information, see [Resource Tags](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/resourcetags.htm)."
  type        = map(string)
  default     = {}
}

variable "gateway_id" {
  description = "(Required) The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the resource."
  type        = string
}

variable "path_prefix" {
  description = "(Required) A path on which to deploy all routes contained in the API deployment specification. For more information, see [Deploying an API on an API Gateway by Creating an API Deployment](https://docs.cloud.oracle.com/iaas/Content/APIGateway/Tasks/apigatewaycreatingdeployment.htm)."
  type        = string
}

variable "logging_policies" {
  description = "(Optional) Policies controlling the pushing of logs to Oracle Cloud Infrastructure Public Logging."
  type = object({
    access_log = optional(object({
      is_enabled = optional(bool)
    }))
    execution_log = optional(object({
      is_enabled = optional(bool)
      log_level  = optional(string)
    }))
  })
  default = {}
}

variable "routes" {
  description = "A list of routes that this API exposes."
  type = list(object({
    backend = object({
      allowed_post_logout_uris   = optional(list(string))
      body                       = optional(string)
      connect_timeout_in_seconds = optional(number)
      function_id                = optional(string)
      headers = optional(object({
        name  = string
        value = string
      }))
      is_ssl_verify_disabled  = optional(bool)
      post_logout_state       = optional(string)
      read_timeout_in_seconds = optional(number)
      routing_backends = optional(object({
        backend = object({
          body                       = optional(string)
          connect_timeout_in_seconds = optional(number)
          function_id                = optional(string)
          headers = object({
            name  = string
            value = string
          })
          is_ssl_verify_disabled  = optional(bool)
          read_timeout_in_seconds = optional(number)
          send_timeout_in_seconds = optional(number)
          status                  = optional(string)
          type                    = optional(string)
          url                     = optional(string)
        })
        key = object({
          expression = string
          is_default = optional(bool)
          name       = string
          type       = string
          values     = string
        })
      }))
      selection_source = optional(object({
        selector = string
        type     = string
      }))
      send_timeout_in_seconds = optional(number)
      status                  = optional(string)
      type                    = optional(string)
      url                     = optional(string)
    })
    logging_policies = optional(object({
      access_log = optional(object({
        is_enabled = optional(bool)
      }))
      execution_log = optional(object({
        is_enabled = optional(bool)
        log_level  = optional(bool)
      }))
    }))
    methods = optional(list(string))
    path    = string
    request_policies = optional(object({
      authorization = optional(object({
        allowed_scope = string
        type          = optional(string)
      }))
      body_validation = optional(object({
        content = optional(object({
          media_type      = string
          validation_type = string
        }))
        required        = optional(bool)
        validation_mode = optional(string)
      }))
      cors = optional(object({
        allowed_headers              = optional(list(string))
        allowed_methods              = optional(list(string))
        allowed_origins              = list(string)
        exposed_headers              = optional(list(string))
        is_allow_credentials_enabled = optional(bool)
        max_age_in_seconds           = optional(number)
      }))
      header_transformations = optional(object({
        filter_headers = optional(object({
          items = object({
            name = string
          })
          type = string
        }))
        rename_headers = optional(object({
          items = object({
            from = string
            to   = string
          })
        }))
        set_headers = optional(object({
          items = object({
            if_exists = optional(bool)
            name      = string
            values    = list(string)
          })
        }))
      }))
      header_validations = optional(object({
        headers = optional(object({
          name     = string
          required = optional(bool)
        }))
        validation_mode = optional(string)
      }))
      query_parameter_transformations = optional(object({
        filter_query_parameters = optional(object({
          items = object({
            name = string
          })
          type = string
        }))
        rename_query_parameters = optional(object({
          items = object({
            from = string
            to   = string
          })
        }))
        set_query_parameters = optional(object({
          items = object({
            if_exists = optional(bool)
            name      = string
            values    = list(string)
          })
        }))
      }))
      query_parameter_validations = optional(object({
        parameters = optional(object({
          name     = string
          required = optional(bool)
        }))
        validation_mode = optional(string)
      }))
      response_cache_lookup = optional(object({
        cache_key_additions        = optional(list(string))
        is_enabled                 = optional(bool)
        is_private_caching_enabled = optional(bool)
        type                       = string
      }))
    }))
    response_policies = optional(object({
      header_transformations = optional(object({
        filter_headers = optional(object({
          items = object({
            name = string
          })
          type = string
        }))
        rename_headers = optional(object({
          items = object({
            from = string
            to   = string
          })
        }))
        set_headers = optional(object({
          items = object({
            if_exists = optional(bool)
            name      = string
            values    = list(string)
          })
        }))
      }))
      response_cache_store = optional(object({
        time_to_live_in_seconds = number
        type                    = string
      }))
    }))
  }))
}

variable "authentication" {
  description = "(Optional) (Updatable) Information on how to authenticate incoming requests."
  type = object({
    type                        = string
    audiences                   = list(string)
    cache_key                   = optional(list(string))
    function_id                 = optional(string)
    is_anonymous_access_allowed = string
    issuers                     = optional(list(string))
    max_clock_skew_in_seconds   = optional(number)
    parameters                  = optional(map(string))
    token_auth_scheme           = string
    token_header                = string
    public_keys = list(object({
      type                        = string
      is_ssl_verify_disabled      = optional(string)
      format                      = string
      alg                         = optional(string)
      e                           = optional(string)
      key                         = optional(string)
      key_ops                     = optional(list(string))
      kid                         = optional(string)
      kty                         = optional(string)
      n                           = optional(string)
      use                         = optional(string)
      max_cache_duration_in_hours = string
      uri                         = string
    }))
  })
}
