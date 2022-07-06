#!/bin/bash

# apt update and install opejdk-8
apt update -y && apt install openjdk-8-jdk -y

# download and install jenkins 

wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
apt update && apt install jenkins -y

# Start and enable jenkins service

systemctl start jenkins && systemctl enable jenkins
