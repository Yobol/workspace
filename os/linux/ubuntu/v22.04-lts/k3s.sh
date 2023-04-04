#!/bin/bash

. install.sh

prepare_docker

prepare_curl

# https://k3s.io/

# install k3s as a service
curl -sfL https://get.k3s.io | sh -
sudo chown yobol.yobol /usr/local/bin/k3s
sudo chown yobol.yobol /etc/rancher/k3s/k3s.yaml
sudo chown yobol.yobol /usr/local/bin/kubectl

# add nodes
# curl -sfL https://get.k3s.io | K3S_URL=https://myserver:6443 K3S_TOKEN=XXX sh -

export KUBECONFIG=/etc/rancher/k3s/k3s.yaml