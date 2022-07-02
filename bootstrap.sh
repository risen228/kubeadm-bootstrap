#!/bin/bash

source <(wget -qO- --no-cache https://raw.githubusercontent.com/risenforces/kubeadm-bootstrap/main/install-crio.sh)
source <(wget -qO- --no-cache https://raw.githubusercontent.com/risenforces/kubeadm-bootstrap/main/install-kubeadm.sh)
source <(wget -qO- --no-cache https://raw.githubusercontent.com/risenforces/kubeadm-bootstrap/main/init-kubeadm.sh)