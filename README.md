# AWS EFS Terraform Module
# Hello from the other side
Simple Terraform module to provision AWS Elastic File System (EFS) with optional mount targets.

## Features

- Create EFS file system with configurable performance settings
- Optional mount targets in specified subnets
- Encryption support with optional KMS key
- Simple and straightforward configuration

## Usage

### Basic Example

```hcl
module "efs" {
  source = "./modules/efs"

  name = "my-efs"

  tags = {
    Environment = "production"
    Team        = "platform"
  }
}
```

### With Mount Targets

```hcl
module "efs" {
  source = "./modules/efs"

  name              = "my-efs"
  subnet_ids        = [aws_subnet.private_a.id, aws_subnet.private_b.id]
  security_group_ids = [aws_security_group.efs.id]

  tags = {
    Environment = "production"
  }
}
```

### Provisioned Throughput Mode

```hcl
module "efs" {
  source = "./modules/efs"

  name                            = "my-efs-provisioned"
  throughput_mode                 = "provisioned"
  provisioned_throughput_in_mibps = 100
  subnet_ids                      = [aws_subnet.private_a.id, aws_subnet.private_b.id]
  security_group_ids              = [aws_security_group.efs.id]

  tags = {
    Environment = "production"
  }
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.8.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 6.9 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 6.9 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_efs_file_system.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/efs_file_system) | resource |
| [aws_efs_mount_target.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/efs_mount_target) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_name"></a> [app\_name](#input\_app\_name) | Application name (3 characters) | `string` | n/a | yes |
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | Common tags to apply to all resources | `map(string)` | <pre>{<br>  "ManagedBy": "OpenTofu"<br>}</pre> | no |
| <a name="input_encrypted"></a> [encrypted](#input\_encrypted) | Enable encryption of data in transit | `bool` | `true` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment name | `string` | n/a | yes |
| <a name="input_kms_key_id"></a> [kms\_key\_id](#input\_kms\_key\_id) | KMS key ID for encryption (optional) | `string` | `null` | no |
| <a name="input_performance_mode"></a> [performance\_mode](#input\_performance\_mode) | Performance mode for the EFS (generalPurpose or maxIO) | `string` | `"generalPurpose"` | no |
| <a name="input_provisioned_throughput_in_mibps"></a> [provisioned\_throughput\_in\_mibps](#input\_provisioned\_throughput\_in\_mibps) | Provisioned throughput in MiB/s (required if throughput\_mode is provisioned) | `number` | `null` | no |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | Security group IDs to associate with mount targets | `list(string)` | `[]` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | List of subnet IDs for mount targets | `list(string)` | `[]` | no |
| <a name="input_throughput_mode"></a> [throughput\_mode](#input\_throughput\_mode) | Throughput mode for the EFS (bursting or provisioned) | `string` | `"bursting"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_dns_name"></a> [dns\_name](#output\_dns\_name) | DNS name of the EFS file system |
| <a name="output_file_system_arn"></a> [file\_system\_arn](#output\_file\_system\_arn) | EFS file system ARN |
| <a name="output_file_system_id"></a> [file\_system\_id](#output\_file\_system\_id) | EFS file system ID |
| <a name="output_mount_target_dns_names"></a> [mount\_target\_dns\_names](#output\_mount\_target\_dns\_names) | Mount target DNS names |
| <a name="output_mount_target_ids"></a> [mount\_target\_ids](#output\_mount\_target\_ids) | Mount target IDs |
<!-- END_TF_DOCS -->
