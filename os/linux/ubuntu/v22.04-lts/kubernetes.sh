#!/bin/bash

# TODO: 确认是否安装 Docker 及有相关执行权限
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube && rm -f ./minikube-linux-amd64
# minikube start
# minikube kubectl -- get po -A
# minikube stop

