variable "subscription_id" {
  type        = string
  description = "Azure Subscription ID"
}

variable "location" {
  type        = string
  description = "Azure Region"
  default     = "West Europe"
}
