#!/bin/bash

apt-get update
apt-get install -y curl

apt-get install -y docker.io
systemctl enable docker
systemctl start docker

curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add

apt-add-repository “deb http://apt.kubernetes.io/ kubernetes-xenial main”
apt-get update
apt-get install -y kubeadm
