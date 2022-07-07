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