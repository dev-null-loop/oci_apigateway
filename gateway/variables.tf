variable "ca_bundles" {
  description = "(Optional) (Updatable) An array of CA bundles that should be used on the Gateway for TLS validation."
  type = object({
    ca_bundle_id             = optional(string)
    certificate_authority_id = optional(string)
    type                     = string
  })
  default = null
}

variable "certificate_id" {
  description = "(Optional) (Updatable) The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the resource."
  type        = string
  default     = null
}

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
  default     = "apigateway"
}

variable "endpoint_type" {
  description = "(Required) Gateway endpoint type. `PUBLIC` will have a public ip address assigned to it, while `PRIVATE` will only be accessible on a private IP address on the subnet.  Example: `PUBLIC` or `PRIVATE`"
  type        = string
}

variable "freeform_tags" {
  description = "(Optional) (Updatable) Free-form tags for this resource. Each tag is a simple key-value pair with no predefined name, type, or namespace. For more information, see [Resource Tags](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/resourcetags.htm)."
  type        = map(string)
  default     = {}
}

variable "network_security_group_ids" {
  description = "(Optional) (Updatable) An array of Network Security Groups OCIDs associated with this API Gateway."
  type        = list(string)
  default     = null
}

variable "response_cache_details" {
  description = "(Optional) (Updatable) Base Gateway response cache."
  type = object({
    authentication_secret_id             = string
    authentication_secret_version_number = number
    connect_timeout_in_ms                = number
    is_ssl_enabled                       = bool
    is_ssl_verify_disabled               = bool
    read_timeout_in_ms                   = number
    send_timeout_in_ms                   = number
    servers = optional(list(object({
      host = optional(string)
      port = optional(number)
    })))
    type = string
  })
  default = null
}

variable "subnet_id" {
  description = "(Required) The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the subnet in which related resources are created."
  type        = string
}
