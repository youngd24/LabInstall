#!/bin/vbash
#############################################################################
#
# erx-backup.sh
#
# Backs up an EdgeRouter-X to tftp server(s)
#
#############################################################################
#
# USAGE:
#
#   * Must have a working tftp server availble to the ER-X, testing was 
#     done against a Debian machine running tftpd-hpa.
#
#############################################################################
#
# TODO:
#
#   * Add an email at the end.
#
#############################################################################


#############################################################################
# VARIABLES
#############################################################################
DATE=`date +%Y-%m-%d-%H%M%S`

#############################################################################
# MAIN
#############################################################################
/opt/vyatta/sbin/vyatta-cfg-cmd-wrapper begin
/opt/vyatta/sbin/vyatta-cfg-cmd-wrapper save tftp://dns01/erx.config.$DATE
/opt/vyatta/sbin/vyatta-cfg-cmd-wrapper save tftp://dns02/erx.config.$DATE
