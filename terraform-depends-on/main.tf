

provider "aws" {
   region     = "eu-north-1"
}

resource "aws_key_pair" "deployer" {
  key_name   = "aws_key"
  public_key = file("~/.ssh/aws_ec2_terraform.pub")
}

resource "aws_s3_bucket" "my_test_bucket" {
  bucket = "test-bucket-1-for-import-45"
  tags = {
    "name" = "test-bucket"
  }
}

resource "aws_instance" "ec2_example" {
   ami           = "ami-0a716d3f3b16d290c"
   instance_type =  "t3.micro"

   tags = {
           Name = "Terraform EC2"
   }
  depends_on = [aws_s3_bucket.my_test_bucket]
}



