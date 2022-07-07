resource "aws_instance" "mylab-instance" {
  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = "Automation"
  vpc_security_group_ids      = [aws_security_group.mylab-security-group.id]
  subnet_id                   = aws_subnet.mylab-subnet1-public.id
  associate_public_ip_address = true

  tags = {
    "Name" = "from-tf-test"
  }

  lifecycle {
    create_before_destroy = true
  }

}

resource "aws_instance" "mylab-jenkins-master" {
  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = "Automation"
  vpc_security_group_ids      = [aws_security_group.mylab-security-group.id]
  subnet_id                   = aws_subnet.mylab-subnet1-public.id
  associate_public_ip_address = true
  user_data                   = file("./Jenkinsinstall.sh")

  tags = {
    "Name" = "Jenkins-Master"
  }

  lifecycle {
    create_before_destroy = true
  }

}

resource "aws_instance" "mylab-ansible-controller" {
  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = "Automation"
  vpc_security_group_ids      = [aws_security_group.mylab-security-group.id]
  subnet_id                   = aws_subnet.mylab-subnet1-public.id
  associate_public_ip_address = true
  user_data                   = file("./InstallAnsibleCN.sh")

  tags = {
    "Name" = "Ansible-Controller"
  }

  lifecycle {
    create_before_destroy = true
  }

}

resource "aws_instance" "mylab-ansible-node1" {
  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = "Automation"
  vpc_security_group_ids      = [aws_security_group.mylab-security-group.id]
  subnet_id                   = aws_subnet.mylab-subnet1-public.id
  associate_public_ip_address = true
  user_data                   = file("./installAnsibleNode.sh")

  tags = {
    "Name" = "Ansible-node1",
    "Tool" =  "Tomcat-Server"
  }

  lifecycle {
    create_before_destroy = true
  }

}


resource "aws_instance" "mylab-ansible-node2" {
  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = "Automation"
  vpc_security_group_ids      = [aws_security_group.mylab-security-group.id]
  subnet_id                   = aws_subnet.mylab-subnet1-public.id
  associate_public_ip_address = true
  user_data                   = file("./installDocker.sh")

  tags = {
    "Name" = "Ansible-node1",
    "Tool" =  "Docker"
  }

  lifecycle {
    create_before_destroy = true
  }

}

