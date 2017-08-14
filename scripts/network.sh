#!/bin/bash -eux

# turn off wifi, remove network interface settings

nmcli radio all off
systemctl stop NetworkManager.service
systemctl mask NetworkManager-wait-online

find /etc/sysconfig/network-scripts/ \
        -name "ifcfg*" \
        -not -name "ifcfg-lo" \
        -exec rm -f {} \;

rm -rf /var/lib/NetworkManager/*
