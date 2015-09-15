#!/bin/bash

# Update the box
yum -y update
yum -y install zlib1g-dev libssl-dev libreadline-gplv2-dev curl wget unzip
yum -y install bzip2 kernel-devel kernel-headers dkms gcc make net-tools patch perl curl wget nfs-utils yum-presto sudo

# Tweak sshd to prevent DNS resolution (speed up logins)
echo 'UseDNS no' >> /etc/ssh/sshd_config

# Remove 5s grub timeout to speed up booting
cat <<EOF > /etc/default/grub
# If you change this file, run 'update-grub' afterwards to update
# /boot/grub/grub.cfg.

GRUB_DEFAULT=0
GRUB_TIMEOUT=0
GRUB_DISABLE_SUBMENU=true
GRUB_TERMINAL_OUTPUT="console"
GRUB_CMDLINE_LINUX="rd.lvm.lv=centos/root rd.lvm.lv=centos/swap crashkernel=auto rhgb quiet"
GRUB_DISABLE_RECOVERY="true"
EOF

grub2-mkconfig --output=/boot/grub2/grub.cfg

echo "Rebooting"
reboot
