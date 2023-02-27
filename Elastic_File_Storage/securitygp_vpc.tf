resource "aws_security_group" "sg" {
  name = "allow_efs"
  description = "allow efs outbound traffic"
  vpc_id = aws_vpc.vpc.id
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port = 22
    protocol  = "tcp"
    to_port   = 22
  }
  egress {
    from_port = 0
    protocol  = "-1"
    to_port   = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name ="allow_efs"

  }
}

resource "aws_security_group" "efs" {
  name = "efs_sg"
  description = "allows inbound efs traffic from ec2"
  vpc_id = aws_vpc.vpc.id
  ingress {
    security_groups = [aws_security_group.sg.id]
    from_port = 2049
    protocol  = "tcp"
    to_port   = 2049
  }
  egress {
    from_port = 0
    protocol  = "-1"
    to_port   = 0
    security_groups = [aws_security_group.sg.id]
  }
}