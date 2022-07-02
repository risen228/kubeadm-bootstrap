#!/bin/bash

OS="xUbuntu_18.04"
VERSION="1.24.1"

# add repositories
echo "deb https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/$OS/ /" > /etc/apt/sources.list.d/devel:kubic:libcontainers:stable.list
echo "deb http://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable:/cri-o:/$VERSION/$OS/ /" > /etc/apt/sources.list.d/devel:kubic:libcontainers:stable:cri-o:$VERSION.list

# add gpg key
curl -L https://download.opensuse.org/repositories/devel:kubic:libcontainers:stable:cri-o:$VERSION/$OS/Release.key | apt-key add -
curl -L https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/$OS/Release.key | apt-key add -

apt-get update
apt-get install -y --allow-change-held-packages cri-o cri-o-runc
apt-mark hold cri-o cri-o-runc

# install crictl
curl -L https://github.com/kubernetes-sigs/cri-tools/releases/download/$VERSION/crictl-${VERSION}-linux-amd64.tar.gz --output crictl-${VERSION}-linux-amd64.tar.gz
tar zxvf crictl-$VERSION-linux-amd64.tar.gz -C /usr/local/bin
rm -f crictl-$VERSION-linux-amd64.tar.gz

# update cri-o settings
echo "cgroup_manager = \"cgroupfs\"" >> /etc/crio/crio.conf
echo "registries = [\"quay.io\", \"docker.io\", \"gcr.io\", \"eu.gcr.io\", \"k8s.gcr.io\"]" >> /etc/crio/crio.conf
echo "conmon = \"\"" >> /etc/crio/crio.conf
echo "conmon_cgroup = \"pod\"" >> /etc/crio/crio.conf

# bootstrap cri-o
systemctl enable crio.service
systemctl start crio.service
