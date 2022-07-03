# kubeadm bootstrap

Script toolbox for full kubernetes installation on Ubuntu 18.04

## Usage

You should execute commands under the `root` user

### Prepare

- Disables swap
- Opens required ports

```sh
source <(wget -qO- https://raw.githubusercontent.com/risenforces/kubeadm-bootstrap/main/prepare.sh)
```

### Bootstrap

```sh
source <(wget -qO- https://raw.githubusercontent.com/risenforces/kubeadm-bootstrap/main/bootstrap.sh)
```

### Bootstrap 2

```sh
NODE_NAME=master-node source <(wget -qO- https://raw.githubusercontent.com/risenforces/kubeadm-bootstrap/main/bootstrap-2.sh)
```