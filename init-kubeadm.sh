#!/bin/bash

OS=xUbuntu_18.04
CRIO_VERSION=1.24
FLANNEL_CIDR="10.224.0.0/16"
CRI_SOCKET="/var/run/crio/crio.sock"

# add repositories
echo "deb https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/$OS/ /"|sudo tee /etc/apt/sources.list.d/devel:kubic:libcontainers:stable.list
echo "deb http://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable:/cri-o:/$CRIO_VERSION/$OS/ /"|sudo tee /etc/apt/sources.list.d/devel:kubic:libcontainers:stable:cri-o:$CRIO_VERSION.list

# add gpg keys for repositories
curl -L https://download.opensuse.org/repositories/devel:kubic:libcontainers:stable:cri-o:$CRIO_VERSION/$OS/Release.key | sudo apt-key add -
curl -L https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/$OS/Release.key | sudo apt-key add -

# install cri-o
sudo apt update
sudo apt -y install cri-o cri-o-runc

# bootstrap cri-o
sudo systemctl enable crio.service
sudo systemctl start crio.service

# initialize kubeadm
kubeadm init --pod-network-cidr=$FLANNEL_CIDR --cri-socket=$CRI_SOCKET

# configure kubectl
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

# untaint node
kubectl taint nodes --all node-role.kubernetes.io/master-

# install flannel
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml