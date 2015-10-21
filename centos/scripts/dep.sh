#!/bin/bash
#
# Setup the the box. This runs as root

yum -y update
yum -y install curl
yum -y install git

git clone https://git.openstack.org/openstack-infra/system-config

cd system-config
bash install_puppet.sh
bash install_modules.sh

yum-config-manager --save --setopt=openstack-kilo.skip_if_unavailable=true
yum -y update

echo "Rebooting"
reboot
