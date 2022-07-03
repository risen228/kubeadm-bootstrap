# Kubernetes bootstrap

Script toolbox for full kubernetes installation on Ubuntu 18.04

## Usage

### On master node

Execute command under the `root` user:

```sh
source <(wget -qO- https://raw.githubusercontent.com/risenforces/kubeadm-bootstrap/main/master.sh)
```

Copy `kubeadm join` command from the output.

### On worker nodes

Execute command under the `root` user:

```sh
source <(wget -qO- https://raw.githubusercontent.com/risenforces/kubeadm-bootstrap/main/worker.sh)
```

Execute `kubeadm join` command copied from master node setup output.