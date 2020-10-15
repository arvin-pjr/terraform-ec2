#!/bin/bash
yum update -y
yum install -y nano wget git

#yum install -y python3
#pip3 install ansible -y

useradd arvin
echo "sample-psswd" | passwd vagrant --stdin
echo "arvin        ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers

#update ssh settings
wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=11KS-7-ax7j8zaUQzU5A9Z5q1j1dJKYrB' -O /tmp/sshd_config
sudo rm -rf /etc/ssh/sshd_config
sudo mv /tmp/sshd_config /etc/ssh/sshd_config
sudo systemctl restart sshd

