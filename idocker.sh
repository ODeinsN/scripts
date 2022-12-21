#!/usr/bin/bash

echo "> removing old dependencies"
sudo apt-get remove docker docker-engine docker.io containerd runc >/dev/null

echo "> installing dependencies"
sudo apt install curl >/dev/null

echo "> installing docker"
curl -fsSL https://get.docker.com -o get-docker.sh
chmod +x get-docker.sh
sudo sh ./get-docker.sh

echo "> adding user to docker group"
sudo groupadd docker
sudo usermod -aG docker $USER
sudo systemctl restart docker
echo "relogin to use 'docker' without sudo"

echo "> cleaning up"
rm -rf ./get-docker.sh

echo "> installing docker-compose"
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

echo "done"
