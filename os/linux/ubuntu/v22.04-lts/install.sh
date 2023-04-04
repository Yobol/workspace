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