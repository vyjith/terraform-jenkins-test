resource "aws_security_group" "allow" {
  name        = "allow_from_all"
  description = "Allow from all traffic"

  ingress {
    description      = ""
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "security-freedom-new"
  }
}
# ec2 instance creating for jenkins project

resource "aws_instance" "jenkins" {
  ami           = data.aws_ami.amazonami.id
  instance_type = "t2.micro"
  key_name = vyjith-new
  user_data = file("jenkins.sh")
  vpc_security_group_ids = [ aws_security_group.allow.id ]

  tags = {
    Name = "Jenkins-project"
  }
}

# ec2 instance creating for docker project

resource "aws_instance" "docker" {
  ami           = data.aws_ami.amazonami.id
  instance_type = "t2.micro"
  key_name = vyjith-new
  user_data = file("docker.sh")
  vpc_security_group_ids = [ aws_security_group.allow.id ]

  tags = {
    Name = "docker-project"
  }
}

# ec2 instance creating for ansible project

resource "aws_instance" "ansible" {
  ami           = data.aws_ami.amazonami.id
  instance_type = "t2.micro"
  key_name = vyjith-new
  user_data = file("ansible.sh")
  vpc_security_group_ids = [ aws_security_group.allow.id ]

  tags = {
    Name = "ansible-project"
  }
}
