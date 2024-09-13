provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "Test-Instance" {
    ami = "ami-0e53db6fd757e38c7"
    instance_type = "t2.micro"
    security_groups = [aws_security_group.sg.name]
    tags = {
        Name="Test EC2"
    }
  
}

resource "aws_security_group" "sg" {
    ingress{
        from_port = 1
        to_port = 65435
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress{
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    }