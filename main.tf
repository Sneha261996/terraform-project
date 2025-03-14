provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-04b4f1a9cf54c11d0"  # Update with a valid AMI ID
  instance_type = "t2.micro"

  tags = {
    Name = "GitHub-Actions-EC2"
  }
}

terraform {
  backend "s3" {
    bucket         = "sneha-terraform-bucket"
    key            = "ec2-instance/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}
