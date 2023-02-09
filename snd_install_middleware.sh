#!/bin/bash

install Ansible et Docker

IP=$(hostname -I | awk '{print $2}')

echo "START - install Docker - "$IP

echo "[2]: install utils & ansible & docker"
sudo yum update -y
sudo yum install -qq -y yum-utils git sshpass wget ansible gnupg2 curl >/dev/null
sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/rhel/docker-ce.repo

sudo yum install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin


echo "[3]: ansible custom"
sed -i 's/.*pipelining.*/pipelining = True/' /etc/ansible/ansible.cfg
sed -i 's/.*allow_world_readable_tmpfiles.*/allow_world_readable_tmpfiles = True/' /etc/ansible/ansible.cfg

echo "[4]: install docker"

sudo usermod -aG docker vagrant # authorize docker for centos user

sudo systemctl start docker

sudo docker run hello-world

echo "END - install Docker"
