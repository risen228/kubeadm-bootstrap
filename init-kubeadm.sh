#!/bin/bash

hostnamectl set-hostname $NODE_NAME
kubeadm init --pod-network-cidr 198.168.101.21/16

mkdir -p $HOME/.kube
cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
chown $(id -u):$(id -g) $HOME/.kube/config