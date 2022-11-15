nstall Ansible et Docker

IP=$(hostname -I | awk '{print $2}')

echo "START - install Docker - "$IP

echo "[1]: install utils & ansible"
sudo yum update -y
sudo yum install -qq -y git sshpass wget ansible gnupg2 curl >/dev/null


echo "[2]: ansible custom"
sed -i 's/.*pipelining.*/pipelining = True/' /etc/ansible/ansible.cfg
sed -i 's/.*allow_world_readable_tmpfiles.*/allow_world_readable_tmpfiles = True/' /etc/ansible/ansible.cfg

echo "[3]: install docker"
sudo curl -fsSL https://get.docker.com -o test-docker.sh
sudo sh test-docker.sh
sudo sermod -aG docker vagrant # authorize docker for centos user

#sudo systemctl daemon-reload
#sudo systemctl restart docker

echo "END - install Docker"

