output "file_system_id" {
  value       = aws_efs_file_system.this.id
  description = "EFS file system ID"
}

output "file_system_arn" {
  value       = aws_efs_file_system.this.arn
  description = "EFS file system ARN"
}

output "dns_name" {
  value       = aws_efs_file_system.this.dns_name
  description = "DNS name of the EFS file system"
}

output "mount_target_ids" {
  value       = try(aws_efs_mount_target.this[*].id, [])
  description = "Mount target IDs"
}

output "mount_target_dns_names" {
  value       = try(aws_efs_mount_target.this[*].dns_name, [])
  description = "Mount target DNS names"
}
