# Uncomment below to manually specify subnet IDs for this compute
#subnet_ids      = [ "subnet-03aeac8b5e66c266a" ]

# Ubuntu Instance Configuration
ami_id           = "ami-0287a05f0ef0e9d9a"
volume_size      = 30
instance_type    = "t2.nano"
volume_type      = "gp2"
timesleep_for_vm = "300s"
vm_username      = "ubuntu"

# Environment Kind
environment = "Development"

# Set allocate_eip to true to create an Elastic IP, or false otherwise
allocate_eip = false

# Security Group Ingress Rules
sg_ingress_rules = [
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
    from_port   = 3389
    protocol    = "tcp"
    to_port     = 3389
  },
]

### The inputs below are automatically populated during execution. No modifications are necessary. ###

# The AWS region
awsRegion = "ap-south-1"

# The VPC where the EC2 instance will be launched
vpcId = "xxxx"

# Tags for EC2 Instance
name = "xxxx"

# Custom Tags Configuration
custom_tags = {
  OS_Kind = "ubuntu"
}
