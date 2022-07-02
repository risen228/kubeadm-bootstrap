#!/bin/bash

swapoff -a

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

echo "Prepare script executed. Run \"reboot\" command to apply settings."