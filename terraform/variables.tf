variable "name_prefix" {
  description = "Prefix for resource names (typically the consuming service name)"
  type        = string
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {}
}
