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
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD54ZijkcXcDo+AarBhkJ3IUafyhU+v4htp4WeQPMQy8HfzRoHXBNSqLV039Hf8vlemhNCkrOBHrdFOjjRPG6g5vNpRv5NYtRuY8NYOPSJTh/1lI+FvwlhIlQfzZGl+SA+AK6W5tK/cQR/goq9es9eL604OTyL43wbaMmVx73+PKtH2YMeh9f/Hr0sVJKC6SQpfYW7suv+2oA24tcArMjDlOwB8+gftQ76DrZ99ZAwy/Blc5CbLGvAXI0ZPTVkkR7t/Z6/KR78LAb0dHatzz95MH2omK/TukYk7d+mlzA/FPPEi/jMufgI2QOPoIKm0KTvBxi1HANVmijtw7etdqJ0L eliano@astin-1877429"
}
resource "aws_security_group" "click-server" {

  ingress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    self      = true
    cidr_blocks = ["0.0.0.0/0"]
  }
ingress {
    from_port = 443
    to_port   = 443
    protocol  = "tcp"
    self      = true
    cidr_blocks = ["0.0.0.0/0"]
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
  key_name = "local"
  tags = {
    Name = "clickServer"
  }
  security_groups = ["${aws_security_group.click-server.name}"]
  connection {
    type     = "ssh"
    user     = "ubuntu"  
    agent    = false     
    timeout = "5"
    host     = self.public_ip
  }
  provisioner "file" {
    source      = "script.sh"
    destination = "/tmp/script.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/script.sh",
      "/tmp/script.sh",
    ]
  }
}

