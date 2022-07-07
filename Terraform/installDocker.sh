#! /bin/bash

# Update repo
apt update -y

# add the user ansible admin
 useradd -m -d /home/ansibleadmin -s /bin/bash ansibleadmin
 
# set password : the below command will avoid re entering the password
echo "ansibleadmin:ansible" | chpasswd

# modify the sudoers file at /etc/sudoers and add entry
echo 'ansibleadmin    ALL=(ALL:ALL) NOPASSWD:ALL' | tee -a /etc/sudoers

# this command is to add an entry to file : echo 'PasswordAuthentication yes' | sudo tee -a /etc/ssh/sshd_config
# the below sed command will find and replace words with spaces "PasswordAuthentication no" to "PasswordAuthentication yes"
sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
sudo service sshd restart

# Docker installation

apt install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release 

mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

apt-get update -y

apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

# user ansibleadmin into docker group

usermod -aG docker ansibleadmin

