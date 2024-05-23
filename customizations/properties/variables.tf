variable "pipeline_id" {
  type        = string
  description = "The ID of the pipeline to which properties are attached."
  default     = ""
}

variable "trigger_id" {
  type        = string
  description = "The ID of the targeted trigger."
  default     = ""
}

variable "property_data" {
  description = "The JSON payload containing a details for a single property."
}