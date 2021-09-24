
locals {
  enable_encryption  = var.encryption ? { dummy_create = true } : {}
  use_encryption_key = var.use_encryption_key ? { dummy_create = true } : {}
}

resource "azurerm_managed_disk" "az_mng_disk" {
  name                   = var.name
  location               = var.location
  resource_group_name    = var.resource_group_name
  storage_account_type   = var.storage_account_type
  storage_account_id     = var.create_option == "Import" ? var.storage_account_id : null
  create_option          = var.create_option
  source_resource_id     = var.create_option == "Copy" ? var.source_resource_id : null
  source_uri             = var.create_option == "Import" ? var.source_uri : null
  image_reference_id     = var.create_option == "FromImage" ? var.image_reference_id : null
  disk_encryption_set_id = var.disk_encryption_set_id
  disk_iops_read_write   = var.disk_iops_read_write
  disk_mbps_read_write   = var.disk_mbps_read_write
  disk_size_gb           = var.disk_size_gb
  tier                   = var.tier
  tags                   = var.tags
  zones                  = var.zones
  network_access_policy  = var.network_access_policy
  disk_access_id         = var.network_access_policy == "AllowPrivate" ? var.disk_access_id : null
  os_type                = var.create_option == "Import" || var.create_option == "Copy" ? var.os_type : null

  dynamic "encryption_settings" {
    for_each = local.enable_encryption
    content {
      enabled = var.encryption
      dynamic "disk_encryption_key" {
        for_each = local.use_encryption_key
        content {
          secret_url      = var.disk_encrypt_secret_url
          source_vault_id = var.disk_encrypt_source_vault_id
        }
      }
      dynamic "key_encryption_key" {
        for_each = local.use_encryption_key
        content {
          key_url         = var.key_encrypt_key_url
          source_vault_id = var.key_encrypt_source_vault_id
        }
      }
    }
  }


}