variable "compartment_id" {
  description = "(Required) (Updatable) The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment in which the resource is created."
  type        = string
}

variable "defined_tags" {
  description = "(Optional) (Updatable) Defined tags for this resource. Each key is predefined and scoped to a namespace. For more information, see [Resource Tags](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/resourcetags.htm).  Example: `{\"Operations.CostCenter\": \"42\"}`"
  type        = map(string)
  default     = null
}

variable "display_name" {
  description = "(Optional) (Updatable) A user-friendly name. Does not have to be unique, and it's changeable. Avoid entering confidential information.  Example: `My new resource`"
  type        = string
  default     = null
}

variable "freeform_tags" {
  description = "(Optional) (Updatable) Free-form tags for this resource. Each tag is a simple key-value pair with no predefined name, type, or namespace. For more information, see [Resource Tags](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/resourcetags.htm).  Example: `{\"Department\": \"Finance\"}`"
  type        = map(string)
  default     = {}
}

variable "gateway_id" {
  description = "(Required) The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the resource."
  type        = string
}

variable "locks" {
  description = "(Optional) Locks associated with this resource."
  type = list(object({
    message = optional(string)
    type    = string
  }))
  default = []
}

variable "path_prefix" {
  description = "(Required) A path on which to deploy all routes contained in the API deployment specification. For more information, see [Deploying an API on an API Gateway by Creating an API Deployment](https://docs.cloud.oracle.com/iaas/Content/APIGateway/Tasks/apigatewaycreatingdeployment.htm)."
  type        = string
}

variable "specification" {
  description = "(Required) (Updatable) The logical configuration of the API exposed by a deployment."
  type = object({
    logging_policies = optional(object({
      access_log = optional(object({
        is_enabled = optional(bool)
      }))
      execution_log = optional(object({
        is_enabled = optional(bool)
        log_level  = optional(string)
      }))
    }))
    request_policies = optional(object({
      authentication = optional(object({
        audiences                   = optional(list(string))
        cache_key                   = optional(list(string))
        function_id                 = optional(string)
        is_anonymous_access_allowed = optional(bool)
        issuers                     = optional(list(string))
        max_clock_skew_in_seconds   = optional(number)
        parameters                  = optional(map(string))
        public_keys = optional(object({
          is_ssl_verify_disabled      = optional(bool)
          max_cache_duration_in_hours = optional(number)
          type                        = string
          uri                         = optional(string)
          keys = optional(list(object({
            alg     = optional(string)
            e       = optional(string)
            format  = string
            key     = optional(string)
            key_ops = optional(list(string))
            kid     = optional(string)
            kty     = optional(string)
            n       = optional(string)
            use     = optional(string)
          })), [])
        }))
        token_auth_scheme = optional(string)
        token_header      = optional(string)
        token_query_param = optional(string)
        type              = string
        validation_failure_policy = optional(object({
          fallback_redirect_path             = optional(string)
          logout_path                        = optional(string)
          max_expiry_duration_in_hours       = optional(number)
          response_code                      = optional(string)
          response_message                   = optional(string)
          response_type                      = optional(string)
          scopes                             = optional(list(string))
          type                               = string
          use_cookies_for_intermediate_steps = optional(bool)
          use_cookies_for_session            = optional(bool)
          use_pkce                           = optional(bool)
          client_details = optional(object({
            client_id                    = optional(string)
            client_secret_id             = optional(string)
            client_secret_version_number = optional(number)
            type                         = string
          }))
        }))
        validation_policy = optional(object({
          is_ssl_verify_disabled      = optional(bool)
          max_cache_duration_in_hours = optional(number)
          type                        = string
          uri                         = optional(string)
        }))
        verify_claims = optional(list(object({
          is_required = optional(bool)
          key         = string
          values      = optional(list(string))
        })), [])
      }))
      cors = optional(object({
        allowed_headers              = optional(list(string))
        allowed_methods              = optional(list(string))
        allowed_origins              = list(string)
        exposed_headers              = optional(list(string))
        is_allow_credentials_enabled = optional(bool)
        max_age_in_seconds           = optional(number)
      }))
      mutual_tls = optional(object({
        allowed_sans                     = optional(list(string))
        is_verified_certificate_required = optional(bool)
      }))
      rate_limiting = optional(object({
        rate_in_requests_per_second = number
        rate_key                    = string
      }))
      usage_plans = optional(object({
        token_locations = list(string)
      }))
    }))
    routes = optional(list(object({
      methods = optional(list(string))
      path    = string
      backend = object({
        type                       = string
        url                        = optional(string)
        function_id                = optional(string)
        body                       = optional(string)
        status                     = optional(number)
        connect_timeout_in_seconds = optional(number)
        read_timeout_in_seconds    = optional(number)
        send_timeout_in_seconds    = optional(number)
        is_ssl_verify_disabled     = optional(bool)
        headers = optional(list(object({
          name  = string
          value = string
        })), [])
      })
    })), [])
  })
}
