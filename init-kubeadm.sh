#!/bin/bash

CRI_SOCKET="unix:///var/run/crio/crio.sock"
FLANNEL_CIDR="10.224.0.0/16"
IP="$(hostname -I)"

# initialize kubeadm
kubeadm init --apiserver-advertise-address=$IP --pod-network-cidr=$FLANNEL_CIDR --cri-socket=$CRI_SOCKET

# configure kubectl
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

# untaint node
kubectl taint nodes --all node-role.kubernetes.io/master-

# install flannel
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml