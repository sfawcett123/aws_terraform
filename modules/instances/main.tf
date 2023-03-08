
resource "aws_key_pair" "instance" {
  key_name   = "instance-key"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_instance" "instance" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"

  key_name        = aws_key_pair.instance.key_name
  vpc_security_group_ids = [aws_security_group.instance.id]
  subnet_id       = var.subnet_id

  tags = {
    Name = "Instance"
  }
}

resource "aws_security_group" "instance" {
  name   = "Instance"
  vpc_id = var.vpc_id
  ingress {
    cidr_blocks = [
      "0.0.0.0/0"
    ]
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}