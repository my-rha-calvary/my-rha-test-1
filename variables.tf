# Required variables
variable "app_name" {
  description = "Application name (3 characters)"
  type        = string

  validation {
    condition     = length(var.app_name) <= 3
    error_message = "App name must be 3 characters or less."
  }
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "common_tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
  default = {
    "ManagedBy"    = "OpenTofu"
  }
}

variable "performance_mode" {
  type        = string
  description = "Performance mode for the EFS (generalPurpose or maxIO)"
  default     = "generalPurpose"
}

variable "throughput_mode" {
  type        = string
  description = "Throughput mode for the EFS (bursting or provisioned)"
  default     = "bursting"
}

variable "provisioned_throughput_in_mibps" {
  type        = number
  description = "Provisioned throughput in MiB/s (required if throughput_mode is provisioned)"
  default     = null
}

variable "encrypted" {
  type        = bool
  description = "Enable encryption of data in transit"
  default     = true
}

variable "kms_key_id" {
  type        = string
  description = "KMS key ID for encryption (optional)"
  default     = null
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of subnet IDs for mount targets"
  default     = []
}

variable "security_group_ids" {
  type        = list(string)
  description = "Security group IDs to associate with mount targets"
  default     = []
}
