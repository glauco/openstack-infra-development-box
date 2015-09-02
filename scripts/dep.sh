#!/bin/bash
#
# Setup the the box. This runs as root

apt-get -y update
apt-get -y install curl
apt-get -y install git

git clone https://git.openstack.org/openstack-infra/system-config

cd system-config
bash install_puppet.sh
bash install_modules.sh

echo "Rebooting"
reboot
sleep 60
