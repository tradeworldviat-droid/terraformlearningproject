#grab aws prifix to mention in security group which allow connect option in aws console

data "aws_ec2_managed_prefix_list" "eic"{

    name = "com.amezonaws.ap-south-1.ec2-instance-connect"
}


resource "aws_security_group" "groupfordocker" {

    name = "this security group use for docker"
    description = "will use for dockeronly"

    ingress {

        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["116.74.138.218/32"]
    }

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        #prefix_list_ids = ["pl-0fa83cebf909345ca"]
        prefix_list_ids = [data.aws_ec2_managed_prefix_list.eic.id]
    }

    egress {

        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
  
}

resource "aws_instance" "dockeruse"{
  
  ami = "ami-078227bf5860cfe25"
  instance_type = "t3.micro"

  vpc_security_group_ids = [aws_security_group.groupfordocker.id]

  tags = {
    Name = "dockerinstance"
    Description = "this will use for docker"
  }

}
