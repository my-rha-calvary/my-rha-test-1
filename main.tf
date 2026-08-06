
resource "aws_efs_file_system" "this" {
  performance_mode                = var.performance_mode
  throughput_mode                 = var.throughput_mode
  provisioned_throughput_in_mibps = var.provisioned_throughput_in_mibps
  encrypted                       = var.encrypted
  kms_key_id                      = var.kms_key_id

  tags = merge(
    var.common_tags,
    {
      Name = format("%s-%s-%s-efs", var.app_name, var.environment)

    }
  )
}

resource "aws_efs_mount_target" "this" {
  count           = length(var.subnet_ids)
  file_system_id  = aws_efs_file_system.this.id
  subnet_id       = var.subnet_ids[count.index]
  security_groups = var.security_group_ids

  depends_on = [aws_efs_file_system.this]
}
