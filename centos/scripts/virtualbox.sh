#!/bin/bash

yum -y install "kernel-devel-$(uname -r)"

mkdir -p /mnt/virtualbox
mount -o loop VBoxGuest*.iso /mnt/virtualbox
sh /mnt/virtualbox/VBoxLinuxAdditions.run
ln -s /opt/VBoxGuestAdditions-*/lib/VBoxGuestAdditions /usr/lib/VBoxGuestAdditions
umount /mnt/virtualbox
rm -rf VBoxGuest*.iso
