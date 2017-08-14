#!/bin/sh -eux

# delete any logs
find /var/log/ -name *.log -exec rm -f {} \;

# Whiteout root
count=$(df --sync / | tail -n 1  | awk '{print $4}')
count=$(($count-1))
dd if=/dev/zero of=/tmp/whitespace bs=1M count=$count || echo "dd exit code $? is suppressed";
rm -rf /tmp/*

sync;
