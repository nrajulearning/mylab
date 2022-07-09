# resource "aws_instance" "mylab-instance" {
#   ami                         = var.ami
#   instance_type               = var.instance_type
#   key_name                    = "Automation"
#   vpc_security_group_ids      = [aws_security_group.mylab-security-group.id]
#   subnet_id                   = aws_subnet.mylab-subnet1-public.id
#   associate_public_ip_address = true

#   tags = {
#     "Name" = "from-tf-test"
#   }

#   lifecycle {
#     create_before_destroy = true
#   }

# }

resource "aws_instance" "mylab-jenkins-master" {
  ami                         = var.ami[0]
  instance_type               = var.instance_type
  key_name                    = "Automation"
  vpc_security_group_ids      = [aws_security_group.mylab-security-group.id]
  subnet_id                   = aws_subnet.mylab-subnet1-public.id
  associate_public_ip_address = true
  user_data                   = file("./Jenkinsinstall.sh")

  tags = {
    "Name" = "Jenkins-Master"
    "Tool" = "Jenkins"
  }

  lifecycle {
    create_before_destroy = true
  }

}

resource "aws_instance" "mylab-ansible-controller" {
  ami                         = var.ami[0]
  instance_type               = var.instance_type
  key_name                    = "Automation"
  vpc_security_group_ids      = [aws_security_group.mylab-security-group.id]
  subnet_id                   = aws_subnet.mylab-subnet1-public.id
  associate_public_ip_address = true
  user_data                   = file("./InstallAnsibleCN.sh")

  tags = {
    "Name" = "Ansible-Controller"
    "Tool" = "Ansible"
  }

  lifecycle {
    create_before_destroy = true
  }

}

resource "aws_instance" "mylab-ansible-node1" {
  ami                         = var.ami[0]
  instance_type               = var.instance_type
  key_name                    = "Automation"
  vpc_security_group_ids      = [aws_security_group.mylab-security-group.id]
  subnet_id                   = aws_subnet.mylab-subnet1-public.id
  associate_public_ip_address = true
  user_data                   = file("./installAnsibleNode.sh")

  tags = {
    "Name" = "Tomcat-server",
    "Tool" = "Tomcat"
  }

  lifecycle {
    create_before_destroy = true
  }

}

resource "aws_instance" "mylab-ansible-node2" {
  ami                         = var.ami[0]
  instance_type               = var.instance_type
  key_name                    = "Automation"
  vpc_security_group_ids      = [aws_security_group.mylab-security-group.id]
  subnet_id                   = aws_subnet.mylab-subnet1-public.id
  associate_public_ip_address = true
  user_data                   = file("./installDocker.sh")

  tags = {
    "Name" = "Docker-Server",
    "Tool" = "Docker"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_instance" "mylab-nexus" {
  ami                         = var.ami[1]
  instance_type               = var.instance_type
  key_name                    = "Automation"
  vpc_security_group_ids      = [aws_security_group.mylab-security-group.id]
  subnet_id                   = aws_subnet.mylab-subnet1-public.id
  associate_public_ip_address = true
  user_data                   = file("./InstallNexus.sh")

  tags = {
    "Name" = "Nexus-Server",
    "Tool" = "Nexus"
  }

  lifecycle {
    create_before_destroy = true
  }
}
