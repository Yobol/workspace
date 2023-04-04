#!/bin/bash

# 配置镜像源并下载更新
./sources.sh

# 配置时区并矫正时间
./datetime.sh


# 安装办公软件
./office.sh

# 安装并配置 zsh
./zsh.sh

# 配置 git 基本信息
./git.sh

# 配置 Docker 基本信息
./docker.sh