resource "aws_instance" "efs_ins" {
  ami = var.ami
  instance_type = var.instance_type
  key_name = var.key_name
  subnet_id = aws_subnet.subnet[0].id
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.sg.id]
  tags = {
    Name="testinstance"
  }

}