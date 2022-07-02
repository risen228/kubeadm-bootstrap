# KubeADM Bootstrap

Script toolbox for full kubernetes installation on Ubuntu 18.04

## Usage

### Prepare

- Disables swap
- Opens required ports

```sh
sudo source <(wget -qO- https://raw.githubusercontent.com/risenforces/kubeadm-bootstrap/main/prepare.sh)
```