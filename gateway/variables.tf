variable "ca_bundles" {
  description = "(Optional) (Updatable) An array of CA bundles that should be used on the Gateway for TLS validation."
  type = list(object({
    ca_bundle_id             = optional(string)
    certificate_authority_id = optional(string)
    type                     = string
  }))
  default = []
}
variable "certificate_id" {
  description = "(Optional) (Updatable) The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the resource which can be empty string."
  type        = string
  default     = null
}
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
variable "endpoint_type" {
  description = "(Required) Gateway endpoint type. `PUBLIC` will have a public ip address assigned to it, while `PRIVATE` will only be accessible on a private IP address on the subnet.  Example: `PUBLIC` or `PRIVATE`"
  type        = string
}
variable "freeform_tags" {
  description = "(Optional) (Updatable) Free-form tags for this resource. Each tag is a simple key-value pair with no predefined name, type, or namespace. For more information, see [Resource Tags](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/resourcetags.htm).  Example: `{\"Department\": \"Finance\"}`"
  type        = map(string)
  default     = {}
}
variable "ip_mode" {
  description = "(Optional) Determines whether the gateway has an IPv4 or IPv6 address assigned to it, or both. `IPV4` means the gateway will only have an IPv4 address assigned to it, and `IPV6` means the gateway will only have an `IPv6` address assigned to it. `DUAL_STACK` means the gateway will have both an IPv4 and IPv6 address assigned to it. Example: `IPV4` or `IPV6` or `DUAL_STACK`"
  type        = string
  default     = null
}
variable "ipv4address_configuration" {
  description = "(Optional) IPv4 address configuration details that should be used when creating the gateway."
  type = object({
    reserved_ip_ids = optional(list(string))
  })
  default = null
}
variable "ipv6address_configuration" {
  description = "(Optional) IPv6 address configuration details that should be used when creating the gateway."
  type = object({
    addresses    = optional(list(string))
    subnet_cidrs = optional(list(string))
  })
  default = null
}
variable "locks" {
  description = "(Optional) Locks associated with this resource."
  type = list(object({
    message = optional(string)
    type    = string
  }))
  default = []
}
variable "network_security_group_ids" {
  description = "(Optional) (Updatable) An array of Network Security Groups OCIDs associated with this API Gateway."
  type        = list(string)
  default     = null
}
variable "response_cache_details" {
  description = "(Optional) (Updatable) Base Gateway response cache."
  type = object({
    authentication_secret_id             = optional(string)
    authentication_secret_version_number = optional(number)
    connect_timeout_in_ms                = optional(number)
    is_ssl_enabled                       = optional(bool)
    is_ssl_verify_disabled               = optional(bool)
    read_timeout_in_ms                   = optional(number)
    send_timeout_in_ms                   = optional(number)
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
