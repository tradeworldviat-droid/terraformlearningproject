resource "aws_security_group" "groupfordocker" {

    name = "this security group use for docker"
    description = "will use for dockeronly"

    ingress {

        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = "0.0.0.0/0"
    }

    egress {

        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = "0.0.0.0/0"
    }
  
}

resource "aws_instance" "dockeruse"{
  
  ami = "ami-078227bf5860cfe25"
  instance_type = "t3.micro"

  vpc_security_group_ids = [aws_security_group.groupfordocker.id]

  tags = {
    name = "dockerinstance"
    description = "this will use for docker"
  }

}
