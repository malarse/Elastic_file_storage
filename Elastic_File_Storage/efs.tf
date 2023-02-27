resource "aws_efs_file_system" "efs" {
  creation_token = "efs"
  performance_mode = "generalPurpose"
  throughput_mode = "bursting"
  encrypted = "true"
  tags = {
    Name= "EFS"
  }
}
resource "aws_efs_mount_target" "efs_mt" {
  file_system_id = "aws_efs_file_system.efs.id"
  subnet_id      = "aws_subnet.subnet[count.index].id"
  security_groups = [aws_security_group.efs.id]
}