#!/bin/bash

# Clear wtmp
cat /dev/null > /var/log/wtmp

yum clean all
