output "instance_nexus_ip_addr" {
  value = aws_instance.mylab-nexus.public_ip
}

output "instance_jenkins_master_ip_addr" {
  value = aws_instance.mylab-jenkins-master.public_ip
}

output "instance_ansible_controller_ip_add" {
  value = aws_instance.mylab-ansible-controller.public_ip
}

output "instance_tomcat_ip_add" {
  value = aws_instance.mylab-ansible-node1.public_ip
}

output "instance_docker_ip_add" {
  value = aws_instance.mylab-ansible-node2.public_ip
}