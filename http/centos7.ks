authconfig --enableshadow --passalgo=sha512
autopart
bootloader
clearpart --all --initlabel
firewall --disabled
firstboot --disabled
install
cdrom
keyboard --vckeymap=us
lang en_US.UTF-8
network --bootproto=dhcp --onboot=yes --device=eth0 --noipv6
reboot --eject
rootpw vagrant
selinux --permissive
skipx
text
timezone Europe/Budapest --utc
user --name=vagrant --password=vagrant --plaintext
zerombr

%addon com_redhat_kdump --disable
%end

%packages --nobase --excludedocs
# graphical boot animation
-plymouth
# mail server
-postfix
# Microcode updates cannot work in a VM
-microcode_ctl

# Unnecessary firmware
-aic94xx-firmware
-alsa-firmware
-alsa-tools-firmware
-ivtv-firmware
-iwl*-firmware

# Don't build rescue initramfs
-dracut-config-rescue
%end

%post --interpreter=/usr/bin/bash --erroronfail
echo "Set passwordless sudo for vagrant user..."
echo "%vagrant ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/vagrant
echo "Complete!"
%end
