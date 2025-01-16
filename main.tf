terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "<= 5.41.0"
    }
  }
}

provider "aws" {
  region                   = var.awsRegion
  shared_credentials_files = ["/root/.aws/credentials"]
  profile                  = var.profile_name
}

#public and private key for EC2 machine
resource "aws_key_pair" "tf-key-pair" {
  key_name   = var.name
  public_key = tls_private_key.rsa.public_key_openssh
  tags       = merge(var.custom_tags)
}
resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

#EIP for static Public IP
resource "aws_eip" "lb" {
  count    = var.allocate_eip ? 1 : 0 # Conditionally create EIP based on a variable
  instance = aws_instance.EC2Instance.id
  tags     = merge(var.custom_tags)
}

#AWS Instance
resource "aws_instance" "EC2Instance" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = aws_key_pair.tf-key-pair.key_name
  tenancy                = "default"
  subnet_id              = element(var.subnet_ids, 0)
  ebs_optimized          = false
  vpc_security_group_ids = [aws_security_group.EC2SecurityGroup.id]
  source_dest_check      = true

  root_block_device {
    volume_size           = var.volume_size
    volume_type           = var.volume_type
    delete_on_termination = true
    tags                  = merge(var.custom_tags, {
      Name = "${var.name}"
    })
  }


  tags = merge(var.custom_tags, {
    Name        = "${var.name}"
    Environment = var.environment
  })

}

#Time sleep till VM gets ready
resource "time_sleep" "wait" {
  depends_on      = [aws_instance.EC2Instance]
  create_duration = var.timesleep_for_vm
}

#Security Group
resource "aws_security_group" "EC2SecurityGroup" {
  description = "MD demo environment"
  vpc_id      = var.vpcId

  dynamic "ingress" {
    for_each = var.sg_ingress_rules
    content {
      cidr_blocks = ingress.value.cidr_blocks
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
    }
  }

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
  }

  tags = merge(var.custom_tags, {
    Name        = "${var.name}-sg"
    Environment = var.environment
  })

}
