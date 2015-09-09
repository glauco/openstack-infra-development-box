install
cdrom
lang en_US.UTF-8
keyboard us
network --bootproto=dhcp
firewall --enabled --service=ssh
rootpw vagrant
authconfig --enableshadow --passalgo=sha512
user --name=vagrant --password=vagrant --shell=/bin/bash
selinux --permissive
timezone UTC
bootloader --location=mbr

text
skipx
zerombr

clearpart --all --initlabel
autopart

auth  --useshadow  --enablemd5
firstboot --disabled
reboot --eject

%packages --ignoremissing
@core
bzip2
kernel-devel
kernel-headers
dkms
gcc
make
net-tools
patch
perl
curl
wget
nfs-utils
yum-presto
sudo
-ipw2100-firmware
-ipw2200-firmware
-ivtv-firmware
%end

