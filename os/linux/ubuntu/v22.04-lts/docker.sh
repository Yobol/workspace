#!/bin/bash

set -e

# Install Docker Engine on Ubuntu - https://docs.docker.com/engine/install/ubuntu/
# note: Images, containers, volumes and networks stored in /var/lib/docker/ aren't automatically removed when you uninstall Docker.
sudo apt-get remove docker docker.io containerd runc

# Install using the apt repository
# 1. Set up the repository
# 1.1. Update the apt package index and install packages to allow apt to use a repository over HTTPS:
sudo apt-get update
sudo apt-get install -y \
    ca-certificates \
    curl
# 1.2. Add Docker’s official GPG key:
sudo mkdir -m 0755 -p /etc/apt/keyrings && sudo rm -f /etc/apt/keyrings/docker.gpg
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
# 1.3. Use the following command to set up the repository:
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
# 2. Install Docker Engine
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo apt-get --fix-broken install -y
# TODO: Install from a package: specific version

# add user to docker user group
sudo gpasswd -a ${USER} docker && newgrp docker

docker ps
