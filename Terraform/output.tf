output "instance_test_ip_addr" {
  value = aws_instance.mylab-instance.public_ip
}

output "instance_jenkins_master_ip_addr" {
  value = aws_instance.mylab-jenkins-master.public_ip
}

output "instance_ansible_controller_ip_add" {
  value = aws_instance.mylab-ansible-controller.public_ip
}

output "instance_ansible_Node01_ip_add" {
  value = aws_instance.mylab-ansible-node1.private_ip
}

output "instance_ansible_Node02_ip_add" {
  value = aws_instance.mylab-ansible-node2.private_ip
}