provider "aws" {
   region                   = "eu-north-1"
}


resource "aws_instance" "ec2_example" {
   ami           = "ami-0a716d3f3b16d290c"
   instance_type =  "t3.micro"

   tags = {
           Name = "Terraform EC2"
   }
}