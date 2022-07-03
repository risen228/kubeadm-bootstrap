#!/bin/bash

hostnamectl set-hostname $NODE_NAME
kubeadm init --pod-network-cidr 198.168.101.21/16
