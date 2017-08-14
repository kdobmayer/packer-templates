#!/bin/bash -eux

# create and authorize vagrant public SSH key

# set a default HOME_DIR environment variable if not set
HOME_DIR="${HOME_DIR:-/home/vagrant}";

pubkey_url="https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub";
mkdir -p /home/vagrant/.ssh
wget --no-check-certificate "$pubkey_url" -O $HOME_DIR/.ssh/authorized_keys;

chown -R vagrant: $HOME_DIR/.ssh
chmod -R go-rwsx $HOME_DIR/.ssh
