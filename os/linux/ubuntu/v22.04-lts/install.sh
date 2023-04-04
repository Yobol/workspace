#!/bin/bash

prepare_wget() {
    if ! [ -x "$(command -v wget)" ]; then
        echo "检测到 wget 未安装"
        echo " ******** 开始安装 wget ******** "
        sudo apt-get install -y wget
        echo " ******** 完成安装 wget ******** "
    else
        echo "检测到 wget 已安装"
        zsh --version
    fi
}

prepare_curl() {
    if ! [ -x "$(command -v curl)" ]; then
        echo "检测到 curl 未安装"
        echo " ******** 开始安装 curl ******** "
        sudo apt-get install -y curl
        echo " ******** 完成安装 curl ******** "
    else
        echo "检测到 curl 已安装"
        curl --version
    fi
}

prepare_zsh() {
    if ! [ -x "$(command -v zsh)" ]; then
        echo "检测到 zsh 未安装"
        echo " ******** 开始安装 zsh ******** "
        sudo apt-get install -y zsh
        echo " ******** 完成安装 zsh ******** "
        sudo chsh -s /bin/zsh
    else
        echo "检测到 zsh 已安装"
        zsh --version
    fi
}

prepare_git() {
    if ! [ -x "$(command -v git)" ]; then
        echo "检测到 git 未安装"
        echo " ******** 开始安装 git ******** "
        sudo apt-get install -y git
        echo " ******** 完成安装 git ******** "
    else
        echo "检测到 git 已安装"
        git --version
    fi
}

prepare_docker() {
    if ! [ -x "$(command -x docker)" ]; then
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
    else
        echo "检测到 docker 已安装"

        # add user to docker user group
        sudo gpasswd -a ${USER} docker && newgrp docker
        docker version
    fi
}

prepare_helm() {
    if ! [ -x "$(command -v helm)" ]; then
        echo "检测到 helm 未安装"
        echo " ******** 开始安装 helm ******** "
        curl https://baltocdn.com/helm/signing.asc | gpg --dearmor | sudo tee /usr/share/keyrings/helm.gpg > /dev/null
        sudo apt-get install apt-transport-https --yes
        echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
        sudo apt-get update
        sudo apt-get install helm
        echo " ******** 完成安装 helm ******** "
    else
        echo "检测到 helm 已安装"
        helm --version
    fi
}