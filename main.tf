terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "us-west-2"
}

resource "aws_key_pair" "local" {
  key_name   = "local"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDFNv8g5f0rxIFndtPRF8ZKfwA7X3pJhtkPxJpeYwtm+9A6WmERjdvDq2VKo3iLL9BS5ga0MkS+YzLirDhG4wV/pEIekZkJhxWmXTjnI6zlS6GQcONTC5EOSM8wlyr5/U3bmPaHoPdJxyOQYFVrZcLnmDeFQfKcz0iGnIRAcCWfhNTwvqMltJD9JUafkHnle4YH+aXAU6oKUvlMNFS7BUijx88ssUJT4vkpsEqg5KYSNdW+616OXaXLoQIltbaRb5wIfVOXA7NL3lfY00+mvjkaSR9QyYc3IJ4iwvunAN9kUWS1b1/pprsjzKcx+l2WuDqzH/R+v1hEd+gbrp00gKwe+NzbtAzDZlUML0HyU9jsgPraaRg9G55GQbq6hK+bytZ5zRlLwDt0FLfjdVDAB1QTxwnuvBYz6FvBXvkbvP16zbG6gze+YluOV+sMAdeRSRNq7sLzulxb9dTHqVzbyMjS/G+z8T/L4MHBq2DNys87wJPs4CSkMM+Di8P9ndWxb0cyJpghoz6IHjaccadI6UpVTrfRZB24Nkf2Y82+kk4lbkSF9zuKPTEloNXddEaxEdfMP0DlGuplsH4wtq2QvfkozrH7+Vt9aofThWpip5xl0Go/bE6cxtbw3xJj/Ix89RMEtZQLgdehM3mRFFJcsiQiI71+o/pNRgsIjUWfUyuO1w== eliano@DESKTOP-IMI4ATT"
}
resource "aws_security_group" "click-server" {

  ingress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    self      = true
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
  }
}
resource "aws_instance" "app_server" {
  ami           = "ami-03d5c68bab01f3496"
  instance_type = "t2.micro"
  key_name      = "local"
  tags = {
    Name = "clickServer"
  }
  security_groups = ["${aws_security_group.click-server.name}"]
}
