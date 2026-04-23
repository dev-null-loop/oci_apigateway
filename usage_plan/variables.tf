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

variable "entitlements" {
  description = "(Required) (Updatable) A collection of entitlements to assign to the newly created usage plan."
  type = list(object({
    description = optional(string)
    name        = string
    quota = optional(object({
      operation_on_breach = string
      reset_policy        = string
      unit                = string
      value               = number
    }))
    rate_limit = optional(object({
      unit  = string
      value = number
    }))
    targets = optional(list(object({
      deployment_id = string
    })))
  }))
}

variable "freeform_tags" {
  description = "(Optional) (Updatable) Free-form tags for this resource. Each tag is a simple key-value pair with no predefined name, type, or namespace. For more information, see [Resource Tags](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/resourcetags.htm).  Example: `{\"Department\": \"Finance\"}`"
  type        = map(string)
  default     = {}
}

variable "locks" {
  description = "(Optional) Locks associated with this resource."
  type = list(object({
    message = optional(string)
    type    = string
  }))
  default = []
}
