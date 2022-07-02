#!/bin/bash

# update packages
apt-get update
apt-get -y upgrade
apt-get install -y gnupg curl

# remove systemd-resolved
systemctl disable systemd-resolved
systemctl stop systemd-resolved
unlink /etc/resolv.conf

# recreate resolv.conf
echo nameserver 8.8.8.8 | tee /etc/resolv.conf

# install dnsmasq
apt-get install -y dnsmasq

# configure dnsmasq
touch /etc/dnsmasq.conf
echo "port=53" >> /etc/dnsmasq.conf
echo "domain-needed" >> /etc/dnsmasq.conf
echo "bogus-priv" >> /etc/dnsmasq.conf
echo "strict-order" >> /etc/dnsmasq.conf
echo "expand-hosts" >> /etc/dnsmasq.conf
echo "domain=$HOSTNAME" >> /etc/dnsmasq.conf
echo "listen-address=127.0.0.1" >> /etc/dnsmasq.conf

# restart dnsmasq
systemctl restart dnsmasq

# disable swap
swapoff -a
sudo sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab

# apply basic ufw settings
ufw default deny incoming
ufw default allow outgoing

# allow ssh
ufw allow ssh

# allow control-plane connections
ufw allow 6443
ufw allow 2379
ufw allow 2380
ufw allow 10250
ufw allow 10259
ufw allow 10257

# allow worker connections
ufw allow 10250
ufw allow 30000:32767/tcp
ufw allow 30000:32767/udp

# enable ufw
ufw --force enable

# fix "/proc/sys/net/bridge/bridge-nf-call-iptables does not exist"
modprobe br_netfilter
echo "br_netfilter" > /etc/modules-load.d/br_netfilter.conf

# fix "/proc/sys/net/ipv4/ip_forward contents are not set to 1"
echo 1 > /proc/sys/net/ipv4/ip_forward
echo "net.ipv4.ip_forward = 1" >> /etc/sysctl.conf

echo "Prepare script executed. Run \"reboot\" command to apply settings."