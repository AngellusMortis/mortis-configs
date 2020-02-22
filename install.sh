#!/bin/bash

rm /etc/ansible/hosts -f
rm ~cbailey/dev/system-manager/host_vars -f
rm ~cbailey/dev/system-manager/group_vars/all/user.yml -f

ln -s ~cbailey/dev/system-manager/files/user/mortis-configs/hosts /etc/ansible/hosts
ln -s ~cbailey/dev/system-manager/files/user/mortis-configs/vars/host_vars ~cbailey/dev/system-manager/host_vars
ln -s ~cbailey/dev/system-manager/files/user/mortis-configs/vars/all.yml ~cbailey/dev/system-manager/group_vars/all/user.yml
