# TF_azurerm_managed_disks

Deploy an Azure Managed Disks with a dedicated Terraform module

## Requirements

* A Resource Group
* A Disk encryption set (if disk encryption is needed)

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_managed_disk.az_mng_disk](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/managed_disk) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_option"></a> [create\_option](#input\_create\_option) | The method to use when creating the managed disk. | `string` | `"Empty"` | no |
| <a name="input_disk_access_id"></a> [disk\_access\_id](#input\_disk\_access\_id) | The ID of the disk access resource for using private endpoints on disks. | `string` | `null` | no |
| <a name="input_disk_encrypt_secret_url"></a> [disk\_encrypt\_secret\_url](#input\_disk\_encrypt\_secret\_url) | The URL to the Key Vault Secret used as the Disk Encryption Key. This can be found as id on the azurerm\_key\_vault\_secret resource. | `string` | `null` | no |
| <a name="input_disk_encrypt_source_vault_id"></a> [disk\_encrypt\_source\_vault\_id](#input\_disk\_encrypt\_source\_vault\_id) | The URL of the Key Vault. This can be found as vault\_uri on the azurerm\_key\_vault resource. | `string` | `null` | no |
| <a name="input_disk_encryption_set_id"></a> [disk\_encryption\_set\_id](#input\_disk\_encryption\_set\_id) | he ID of a Disk Encryption Set which should be used to encrypt this Managed Disk. | `string` | `null` | no |
| <a name="input_disk_iops_read_write"></a> [disk\_iops\_read\_write](#input\_disk\_iops\_read\_write) | The number of IOPS allowed for this disk; only settable for UltraSSD disks. One operation can transfer between 4k and 256k bytes. | `string` | `null` | no |
| <a name="input_disk_mbps_read_write"></a> [disk\_mbps\_read\_write](#input\_disk\_mbps\_read\_write) | The bandwidth allowed for this disk; only settable for UltraSSD disks. MBps means millions of bytes per second. | `string` | `null` | no |
| <a name="input_disk_size_gb"></a> [disk\_size\_gb](#input\_disk\_size\_gb) | Specifies the size of the managed disk to create in gigabytes. If create\_option is Copy or FromImage, then the value must be equal to or greater than the source's size. The size can only be increased. | `string` | `null` | no |
| <a name="input_encryption"></a> [encryption](#input\_encryption) | Enable encryption for the Managed Disk. A Disk Encryption Set should be defined. | `bool` | `false` | no |
| <a name="input_image_reference_id"></a> [image\_reference\_id](#input\_image\_reference\_id) | ID of an existing platform/marketplace disk image to copy when create\_option is FromImage. | `string` | `null` | no |
| <a name="input_key_encrypt_key_url"></a> [key\_encrypt\_key\_url](#input\_key\_encrypt\_key\_url) | The URL to the Key Vault Key used as the Key Encryption Key. This can be found as id on the azurerm\_key\_vault\_key resource. | `string` | `null` | no |
| <a name="input_key_encrypt_source_vault_id"></a> [key\_encrypt\_source\_vault\_id](#input\_key\_encrypt\_source\_vault\_id) | The ID of the source Key Vault. | `string` | `null` | no |
| <a name="input_location"></a> [location](#input\_location) | Specified the supported Azure location where the resource exists. | `string` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | Specifies the name of the Managed Disk. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_network_access_policy"></a> [network\_access\_policy](#input\_network\_access\_policy) | Policy for accessing the disk via network. Allowed values are AllowAll, AllowPrivate, and DenyAll. | `string` | `null` | no |
| <a name="input_os_type"></a> [os\_type](#input\_os\_type) | Specify a value when the source of an Import or Copy operation targets a source that contains an operating system. Valid values are Linux or Windows. | `string` | `null` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the Resource Group where the Managed Disk should exist. | `string` | n/a | yes |
| <a name="input_source_resource_id"></a> [source\_resource\_id](#input\_source\_resource\_id) | The ID of an existing Managed Disk to copy create\_option is Copy or the recovery point to restore when create\_option is Restore | `string` | `null` | no |
| <a name="input_source_uri"></a> [source\_uri](#input\_source\_uri) | URI to a valid VHD file to be used when create\_option is Import. | `string` | `null` | no |
| <a name="input_storage_account_id"></a> [storage\_account\_id](#input\_storage\_account\_id) | The ID of the Storage Account where the source\_uri is located. Required when create\_option is set to Import. | `string` | `null` | no |
| <a name="input_storage_account_type"></a> [storage\_account\_type](#input\_storage\_account\_type) | The type of storage to use for the managed disk. | `string` | `"Standard_LRS"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resource. | `map` | `{}` | no |
| <a name="input_tier"></a> [tier](#input\_tier) | The disk performance tier to use. This feature is currently supported only for premium SSDs. | `string` | `null` | no |
| <a name="input_use_encryption_key"></a> [use\_encryption\_key](#input\_use\_encryption\_key) | Use encryption Key for encryption settings. If set to true, variables disk\_encrypt\_secret\_url, disk\_encrypt\_source\_vault\_id, key\_encrypt\_key\_url and key\_encrypt\_source\_vault\_id should be mandatory | `bool` | `false` | no |
| <a name="input_zones"></a> [zones](#input\_zones) | A collection containing the availability zone to allocate the Managed Disk in. | `any` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_mng_disk_id"></a> [mng\_disk\_id](#output\_mng\_disk\_id) | The ID of the managed disk |