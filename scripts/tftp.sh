#!/bin/bash

sudo apt-get -y install xinetd tftpd tftp
sudo mkdir /tftproot
sudo chmod -R 777 /tftproot
sudo chown -R nobody /tftproot

sudo cat <<- EOF > /etc/xinetd.d/tftp
service tftp
{
   protocol        = udp
   port            = 69
   socket_type     = dgram
   wait            = yes
   user            = nobody
   server          = /usr/sbin/in.tftpd
   server_args     = /tftpboot
   disable         = no
}
EOF

sudo service xinetd restart
