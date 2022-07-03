#!/bin/bash

apt-get update

apt-get install -y docker.io
systemctl enable docker
systemctl start docker

curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | tee /etc/apt/sources.list.d/kubernetes.list

apt-get update
apt-get install -y kubeadm
