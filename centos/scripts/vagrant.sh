#!/bin/bash

# Vagrant specific
date > /etc/vagrant_box_build_time

# Installing vagrant keys
mkdir -pm 700 /home/vagrant/.ssh
wget --no-check-certificate 'https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub' -O /home/vagrant/.ssh/authorized_keys
chmod 0600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant /home/vagrant/.ssh

echo 'vagrant ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers.d/vagrant
echo 'Defaults:vagrant !requiretty' >> /etc/sudoers.d/vagrant
chmod 0440 /etc/sudoers.d/vagrant

# Customize the message of the day
echo 'Development Environment' > /etc/motd
