#!/bin/bash

VERSION="1.24.1-00"

# install dependencies
apt-get update
apt-get install -y apt-transport-https ca-certificates

# add gpg keys for repositories
curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg

# add kubernetes repository
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list

# install tools
apt-get update
apt-get install -y --allow-change-held-packages kubelet=$VERSION kubeadm=$VERSION kubectl=$VERSION
apt-mark hold kubelet kubeadm kubectl