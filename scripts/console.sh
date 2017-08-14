#!/bin/bash -eux
#
# enable serial console output for KVM virtual machines

# get the original value of linux command line
grub_cmdline=$(grep GRUB_CMDLINE_LINUX /etc/default/grub | cut --fields='2' --delimiter='"')

# enable virtual console
sed -i "s:^GRUB_CMDLINE_LINUX.*:GRUB_CMDLINE_LINUX=\"console=ttyS0,115200 ${grub_cmdline}\":" /etc/default/grub

# generate a configuration file for GRUB
grub2-mkconfig -o /boot/grub2/grub.cfg
