variable "name" {
  description = "Specifies the name of the Managed Disk. Changing this forces a new resource to be created."
  type        = string
}
variable "location" {
  description = "Specified the supported Azure location where the resource exists."
  type        = string
  default     = null
}
variable "resource_group_name" {
  description = "The name of the Resource Group where the Managed Disk should exist."
  type        = string
}
variable "storage_account_type" {
  description = "The type of storage to use for the managed disk."
  type        = string
  default     = "Standard_LRS"
  validation {
    condition     = contains(["Standard_LRS", "Premium_LRS", "StandardSSD_LRS", "UltraSSD_LRS"], var.storage_account_type)
    error_message = "Storage account type should be Standard_LRS, Premium_LRS, StandardSSD_LRS or UltraSSD_LRS."
  }
}
variable "storage_account_id" {
  description = "The ID of the Storage Account where the source_uri is located. Required when create_option is set to Import."
  type        = string
  default     = null
}
variable "create_option" {
  description = "The method to use when creating the managed disk."
  type        = string
  default     = "Empty"
  validation {
    condition     = contains(["Import", "Empty", "Copy", "FromImage", "Restore"], var.create_option)
    error_message = "Creation option should be only Import, Empty, Copy, FromImage or Restore."
  }
}
variable "source_resource_id" {
  description = "The ID of an existing Managed Disk to copy create_option is Copy or the recovery point to restore when create_option is Restore"
  type        = string
  default     = null
}
variable "source_uri" {
  description = "URI to a valid VHD file to be used when create_option is Import."
  type        = string
  default     = null
}
variable "image_reference_id" {
  description = "ID of an existing platform/marketplace disk image to copy when create_option is FromImage."
  type        = string
  default     = null
}
variable "disk_encryption_set_id" {
  description = "he ID of a Disk Encryption Set which should be used to encrypt this Managed Disk."
  type        = string
  default     = null
}
variable "disk_iops_read_write" {
  description = "The number of IOPS allowed for this disk; only settable for UltraSSD disks. One operation can transfer between 4k and 256k bytes."
  type        = string
  default     = null
}
variable "disk_mbps_read_write" {
  description = "The bandwidth allowed for this disk; only settable for UltraSSD disks. MBps means millions of bytes per second."
  type        = string
  default     = null
}
variable "disk_size_gb" {
  description = "Specifies the size of the managed disk to create in gigabytes. If create_option is Copy or FromImage, then the value must be equal to or greater than the source's size. The size can only be increased."
  type        = string
  default     = null
}
variable "tier" {
  description = "The disk performance tier to use. This feature is currently supported only for premium SSDs."
  type        = string
  default     = null
}
variable "tags" {
  description = "A mapping of tags to assign to the resource."
  default     = {}
}
variable "zones" {
  description = "A collection containing the availability zone to allocate the Managed Disk in."
  default     = null
}
variable "network_access_policy" {
  description = "Policy for accessing the disk via network. Allowed values are AllowAll, AllowPrivate, and DenyAll."
  type        = string
  default     = null
}
variable "disk_access_id" {
  description = "The ID of the disk access resource for using private endpoints on disks."
  type        = string
  default     = null
}
variable "encryption" {
  description = "Enable encryption for the Managed Disk. A Disk Encryption Set should be defined."
  type        = bool
  default     = false
}
variable "use_encryption_key" {
  description = "Use encryption Key for encryption settings. If set to true, variables disk_encrypt_secret_url, disk_encrypt_source_vault_id, key_encrypt_key_url and key_encrypt_source_vault_id should be mandatory"
  type        = bool
  default     = false
}
variable "disk_encrypt_secret_url" {
  description = "The URL to the Key Vault Secret used as the Disk Encryption Key. This can be found as id on the azurerm_key_vault_secret resource."
  type        = string
  default     = null
}
variable "disk_encrypt_source_vault_id" {
  description = "The URL of the Key Vault. This can be found as vault_uri on the azurerm_key_vault resource."
  type        = string
  default     = null
}
variable "key_encrypt_key_url" {
  description = "The URL to the Key Vault Key used as the Key Encryption Key. This can be found as id on the azurerm_key_vault_key resource."
  type        = string
  default     = null
}
variable "key_encrypt_source_vault_id" {
  description = "The ID of the source Key Vault."
  type        = string
  default     = null
}
variable "os_type" {
  description = "Specify a value when the source of an Import or Copy operation targets a source that contains an operating system. Valid values are Linux or Windows."
  type        = string
  default     = null
}