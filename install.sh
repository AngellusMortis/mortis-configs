#!/bin/bash

rm /etc/ansible/hosts -f
rm ~cbailey/dev/system-manager/host_vars -f
mkdir -p ~cbailey/dev/system-manager/group_vars/all/
rm ~cbailey/dev/system-manager/group_vars/all/user.yml -f
rm ~cbailey/dev/system-manager/group_vars/pi -f

mkdir -p ~cbailey/dev/system-manager/files/user/mortis-configs/vars/
ln -s ~cbailey/dev/system-manager/files/user/mortis-configs/vars/host_vars ~cbailey/dev/system-manager/host_vars
ln -s ~cbailey/dev/system-manager/files/user/mortis-configs/vars/all.yml ~cbailey/dev/system-manager/group_vars/all/user.yml
ln -s ~cbailey/dev/system-manager/files/user/mortis-configs/vars/pi_vars ~cbailey/dev/system-manager/group_vars/pi
ln -s ~cbailey/dev/system-manager/files/user/mortis-configs/vars/pirack_vars ~cbailey/dev/system-manager/group_vars/pirack
ln -s ~cbailey/dev/system-manager/files/user/mortis-configs/vars/dns_vars ~cbailey/dev/system-manager/group_vars/dns
