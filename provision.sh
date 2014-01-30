#!/usr/bin/env bash
if [ -f "/var/vagrant_provision" ]; then
  echo "Provisioned..."
  exit 0
fi
echo "Getting RPMforge rlease package..."
wget -c http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm
echo "Install DAGs GPG Key...."
rpm --import http://apt.sw.be/RPM-GPG-KEY.dag.txt
echo "Verify the package...and install"
rpm -K rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm
if [ $? -ne 0 ]; then
  echo "Unable to verify package"
  exit 1
fi
rpm -i rpmforge-release-0.5.3-1.el6.rf.*.rpm
echo "Installing dkms ...."
yum --enablerepo rpmforge install -y dkms >/dev/null 2>&1
echo "install Development tools ..."
yum groupinstall -y "Development Tools"
echo "install kernel-devel...."
yum install -y  kernel-devel >/dev/null 2>&1
echo "Install X WIndows ...."
yum groupinstall -y "X Window System" >/dev/null 2>&1
echo "update OS..."
yum update  -y  >/dev/null 2>&1
echo "Installing GuestAdditions ...."
wget -c http://download.virtualbox.org/virtualbox/4.3.0/VBoxGuestAdditions_4.3.0.iso
umount /mnt
echo "Mounting GuestAdditions .... "
mount VBoxGuestAdditions_4.3.0.iso -o loop /mnt
echo "Mounting LinuxAdditions...."
sh /mnt/VBoxLinuxAdditions.run >/dev/null 2>&1
touch "/var/vagrant_provision"
echo "rebooting now..."
reboot now

