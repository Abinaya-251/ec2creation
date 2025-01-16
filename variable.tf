variable "awsRegion" {
  default = "ap-south-1"
}

variable "ami_id" {
  default = "ami-0287a05f0ef0e9d9a"
}

variable "subnet_ids" {
  type    = list(string)
  default = ["subnet-0ad82b047e34eaaaa"]
}

variable "vpcId" {
  default = "vpc-003299f29328a9652"
}

variable "name" {
  default = "MD-test-vm"
}

variable "timesleep_for_vm" {
  default = "150s"
}

variable "environment" {
  default = "test"
}

variable "volume_size" {
  default = 30
}

variable "volume_type" {
  default = "gp2"
}

variable "instance_type" {
  default = "t2.medium"
}

variable "custom_tags" {
  default = ""
}

variable "profile_name" {
  default = "default"
}

variable "allocate_eip" {
  description = "Set to true if you want to allocate an Elastic IP, false otherwise"
  type        = bool
  default     = true
}

variable "sg_ingress_rules" {
  description = "List of ingress rules for the security group"
  type = list(object({
    cidr_blocks = list(string)
    from_port   = number
    to_port     = number
    protocol    = string
  }))
  default = [
    {
      cidr_blocks = ["0.0.0.0/0"]
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
    },
    {
      cidr_blocks = ["0.0.0.0/0"]
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
    },
    {
      cidr_blocks = ["0.0.0.0/0"]
      from_port   = 9000
      to_port     = 9000
      protocol    = "tcp"
    },
    {
      cidr_blocks = ["0.0.0.0/0"]
      from_port   = 8080
      to_port     = 8080
      protocol    = "tcp"
    },
    {
      cidr_blocks = ["0.0.0.0/0"]
      from_port   = 8082
      to_port     = 8082
      protocol    = "tcp"
    },
    {
      cidr_blocks = ["0.0.0.0/0"]
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
    },
    {
      cidr_blocks = ["0.0.0.0/0"]
      from_port   = 2049
      to_port     = 2049
      protocol    = "tcp"
    },
    {
      cidr_blocks = ["0.0.0.0/0"]
      from_port   = 3389 # RDP port
      to_port     = 3389 # RDP port
      protocol    = "tcp"
    },
  ]
}

variable "vm_username" {
  default = "ubuntu"
}
