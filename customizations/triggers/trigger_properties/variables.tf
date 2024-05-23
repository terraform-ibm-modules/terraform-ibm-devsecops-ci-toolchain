variable "pipeline_id" {
  type        = string
  description = "The ID of the pipeline containing the targeted trigger."
  default     = ""
}

variable "trigger_id" {
  type        = string
  description = "The ID of the trigger to attach the property."
  default     = ""
}

variable "trigger_property_name" {
  type        = string
  description = "The name of the trigger property."
  default     = ""
}

variable "trigger_property_type" {
  type        = string
  description = "The trigger property type."
  default     = "text"
}

variable "trigger_property_value" {
}

variable "trigger_property_path" {
  default = ""
}
