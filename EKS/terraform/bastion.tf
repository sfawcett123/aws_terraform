resource "aws_security_group" "bastion" {
  name   = "bastion"
  vpc_id = aws_vpc.main.id
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

resource "aws_key_pair" "bastion" {
  key_name   = "bastion-key"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_instance" "bastion" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"

  key_name        = aws_key_pair.bastion.key_name
  vpc_security_group_ids = ["${aws_security_group.bastion.id}"]
  subnet_id       = aws_subnet.bastion_subnets[0].id

  tags = {
    Name = "EKS Bastion"
  }
}

resource "aws_eip" "ip-test-env" {
  instance = aws_instance.bastion.id
  vpc      = true
}

resource "aws_route_table" "bastion" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
  tags = {
    Name = "Bastion Route Table"
  }
}

resource "aws_route_table_association" "bastion-association" {
  subnet_id      = aws_instance.bastion.subnet_id
  route_table_id = aws_route_table.bastion.id
}

output "IP_Address" {
  value = aws_instance.bastion.public_ip 
  description = "Public IP address"
}
