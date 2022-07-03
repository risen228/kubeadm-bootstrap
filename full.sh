#!/bin/bash

source <(wget -qO- https://raw.githubusercontent.com/risenforces/kubeadm-bootstrap/main/prepare.sh)
source <(wget -qO- https://raw.githubusercontent.com/risenforces/kubeadm-bootstrap/main/install-kubeadm-2.sh)
source <(wget -qO- https://raw.githubusercontent.com/risenforces/kubeadm-bootstrap/main/init-kubeadm-2.sh)