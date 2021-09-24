output "mng_disk_id" {
  value       = azurerm_managed_disk.az_mng_disk.id
  description = "The ID of the managed disk"
}