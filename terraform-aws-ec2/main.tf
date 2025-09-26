provider "aws" {
   region                   = "eu-north-1"
}
variable "instance_type" {
  description = "Type of instance to use"
  type        = string
  default     = "t3.large"

  validation {
    condition     = can(regex("^[Tt][2-3]\\.(nano|micro|small)$", var.instance_type))
    error_message = "Invalid Instance Type name. You can only choose: t2.nano, t2.micro, t2.small, t3.nano, t3.micro, t3.small"
  }
}

resource "aws_instance" "ec2_example" {
  ami           = "ami-0a716d3f3b16d290c"
  instance_type = var.instance_type

  tags = {
    Name = "Terraform EC2"
  }
}

