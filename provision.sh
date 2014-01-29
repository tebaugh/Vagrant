#!/usr/bin/env bash

echo "Installing GuestAdditions ...."
wget -c http://download.virtualbox.org/virtualbox/4.3.0/VBoxGuestAdditions_4.3.0.iso
umount /mnt
echo "Mounting GuestAdditions .... "
mount VBoxGuestAdditions_4.3.0.iso -o loop /mnt
echo "Install X WIndows ...."
yum groupinstall -y "X Window System" >/dev/null 2>&1
echo "update OS..."
yum update  -y  >/dev/null 2>&1 
echo "install kernel-devel...."
yum install -y  kernel-devel >/dev/null 2>&1
echo "Mounting LinuxAdditions...."
sh /mnt/VBoxLinuxAdditions.run >/dev/null 2>&1
echo "Shutting down..."
/sbin/shutdown -h now


