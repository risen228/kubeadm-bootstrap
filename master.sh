#!/bin/bash

read -p "Enter node name [master-node]: " NODE_NAME
export NODE_NAME=${NODE_NAME:-master-node}

source <(wget -qO- https://raw.githubusercontent.com/risenforces/kubeadm-bootstrap/main/prepare.sh)
source <(wget -qO- https://raw.githubusercontent.com/risenforces/kubeadm-bootstrap/main/install-kubeadm.sh)
source <(wget -qO- https://raw.githubusercontent.com/risenforces/kubeadm-bootstrap/main/init-kubeadm.sh)
