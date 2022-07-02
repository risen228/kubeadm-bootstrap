# kubeadm bootstrap

Script toolbox for full kubernetes installation on Ubuntu 18.04

## Usage

You should execute commands under the `root` user

### Prepare

- Disables swap
- Opens required ports

```sh
source <(wget -qO- --no-cache https://raw.githubusercontent.com/risenforces/kubeadm-bootstrap/main/prepare.sh)
```

### Bootstrap

```sh
source <(wget -qO- --no-cache https://raw.githubusercontent.com/risenforces/kubeadm-bootstrap/main/bootstrap.sh)
```
