provider "aws" {
    region = "us-east-1"
}


resource "aws_instance" "demo_instance" {

    ami = "ami-0230bd60aa48260c6"
    instance_type = "t2.micro"
    key_name = "docker"
    tags = {
      "Project" = "devsecops"
    }
}

resource "aws_security_group" "demo_instance_security_group" {

    name = "demo_instance_security_group"

    ingress {
    description      = "ssh"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  
    }

    egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    }
  
}