# Configure the AWS VPC
provider "aws" {
  profile = default
  region     = "us-east-1"
}

resource "aws_vpc" "ntc_vpc" {
  cidr_block           = "10.123.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "dev"
  }
}

# Configure the AWS Subnet

resource "aws_subnet" "ntc_public_subnet" {
  vpc_id                  = aws_vpc.ntc_vpc.id
  cidr_block              = "10.123.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"

  tags = {
    Name = "dev-public"
  }
}

# Configure the AWS Internet Gateway

resource "aws_internet_gateway" "ntc_internet_gateway" {
  vpc_id = aws_vpc.ntc_vpc.id

  tags = {
    Name = "dev-igw"
  }
}

# Configure the AWS Route Table

resource "aws_route_table" "ntc_public_rt" {
  vpc_id = aws_vpc.ntc_vpc.id

  tags = {
    Name = "dev-public-rt"
  }
}

# Configure the AWS Default Route

resource "aws_route" "default_route" {
  route_table_id         = aws_route_table.ntc_public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.ntc_internet_gateway.id
}

# Configure the AWS Route Table Association

resource "aws_route_table_association" "ntc_public_assoc" {
  subnet_id      = aws_subnet.ntc_public_subnet.id
  route_table_id = aws_route_table.ntc_public_rt.id
}

# Configure the AWS Security Groups
resource "aws_security_group" "ntc_sg" {
  name        = "dev_sg"
  description = "dev security group"
  vpc_id      = aws_vpc.ntc_vpc.id

  # Configure the AWS Route Inress (Inbound)

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["71.245.173.144/32"]

  }

  # Configure the AWS Route Egress (Outbound)

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

# Configure the AWS Key Pair

resource "aws_key_pair" "ntc_auth" {
  key_name   = "ntckey"
  public_key = "terraform/ntckey.pub"
}

# Configure the AWS CE2

resource "aws_instance" "dev_node" {
  instance_type          = "t2.micro"
  ami                    = data.aws_ami.server_ami.id
  key_name               = aws_key_pair.ntc_auth.id
  vpc_security_group_ids = [aws_security_group.ntc_sg.id]
  subnet_id              = aws_subnet.ntc_public_subnet.id
  user_data              = "terrafrom/userdata.tpl"

  root_block_device {
    volume_size = 10
  }

  tags = {
    Name = "dev-node"
  }
  # Configure the Provisioner

 # provisioner "local-exec" {
 #   command = templatefile("${var.host_os}-ssh-config.tpl", {
 #     hostname     = self.public_ip,
 #     user         = "ec2-user",
 #     identityfile = "terraform/ntckey"
 #   })
 #   interpreter = var.host_os == "linux" ? ["bash", "-c"] : ["powershell", "command"]
 # }

}




