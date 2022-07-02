#!/bin/bash

source <(wget -qO- https://raw.githubusercontent.com/risenforces/kubeadm-bootstrap/main/install-crio.sh)
source <(wget -qO- https://raw.githubusercontent.com/risenforces/kubeadm-bootstrap/main/install-kubeadm.sh)
source <(wget -qO- https://raw.githubusercontent.com/risenforces/kubeadm-bootstrap/main/init-kubeadm.sh)