	provider "aws" {
	    version = "~> 2.0"
	    region = "us-east-1"
	}

	resource "aws_instance" "dev" {
	    count = 3
	    ami = "ami-0ac80df6eff0e70b5"
	    instance_type = "t2.micro"
	    key_name = "terraform-aws"
	    tags = {
		Name = "dev${count.index}"
	    }
	    vpc_security_group_ids = ["sg-039f600d9d0dbd45d"]
	}

	resource "aws_security_group" "acesso_ssh" {
	  name        = "acesso_ssh"
	  description = "acesso_ssh"
	 # vpc_id      = "${aws_vpc.main.id}"

	  ingress {
	    description = "acesso_ssh"
	    from_port   = 22
	    to_port     = 22
	    protocol    = "tcp"
	    cidr_blocks = ["201.46.18.13/32"]
	  }

	 /* egress {
	   from_port   = 0
	    to_port     = 0
	    protocol    = "-1"
	    cidr_blocks = ["0.0.0.0/0"]
	  }*/

	  tags = {
	    Name = "ssh"
	  }
	}
