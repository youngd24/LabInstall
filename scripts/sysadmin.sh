#!/bin/bash
################################################################################
#
# sysadmin.sh
#
# Script to create the standard lab sysadmin account
#
# Run as root on a Linux machine
#
################################################################################

if [ $UID -ne 0 ]; then
  echo "Script must be run as root"
  exit 0
fi

################################################################################
# VARIABLES
################################################################################


################################################################################
# MAIN
################################################################################
# Add the user account, make sure they're in the correct groups
useradd -c "System Admin" \
        -d /home/sysadmin \
        -G dialout,sudo,users,netdev \
        -u 2323 \
        -s /bin/bash \
        --create-home \
        sysadmin

echo "sysadmin ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/010_sysadmin-nopasswd

mkdir $HOME/.ssh
chown 700 $HOME/.ssh
ssh-keygen -t rsa -b 1024 -C "sysadmin@$HOSTNAME" -P "" -f $HOME/.ssh/id_rsa
cat ssh_sysadmin_pubkey.txt > $HOME/.ssh/authorized_keys

sudo apt-get -y install \
      perl \
      libnet-ssleay-perl \
      openssl \
      libauthen-pam-perl \
      libpam-runtime \
      libio-pty-perl \
      apt-show-versions \
      python

sudo wget http://prdownloads.sourceforge.net/webadmin/webmin_1.900_all.deb
sudo dpkg --install webmin_1.900_all.deb
