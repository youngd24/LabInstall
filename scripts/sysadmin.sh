#!/bin/bash
#

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
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAAAgQDdtduDvFyNSgiFHNRA94z+xIDqiXtBqjQZ7XloR8C25n9f3HErOJ5s1rtvF1m+BCGJyB+7mYbNJM76tipnhOd+bAR7vssKeuVTa5bte+XnuZ/V5dE6HVRCUKIiVJXp0UC7CkDcE157x7B8mDtwXYu04p+bYzBFZfUlKguw7qrbPw== sysadmin@internal.yhlsecurity.net" > $HOME/.ssh/authorized_keys

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
