#!/bin/bash -ex
#
# configure yum, update system packages, install additional packages, then clean cache

cat >> /etc/yum.conf <<EOF
http_caching = packages
clean_requirements_on_remove = True
assumeyes = True
EOF

yum install epel-release
yum install yum-utils && yum-config-manager --enable cr
yum update

yum install \
        bind-utils \
        deltarpm \
        git \
        jq \
        net-tools \
        nfs-utils \
        sudo \
        unzip \
        vim \
        wget

yum --enablerepo='*' clean all
