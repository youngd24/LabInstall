#!/usr/bin/env perl
################################################################################
#
# rutgers_ip.pl
#
# Script to import the Rutgers IP block list to the ER-X
#
# Darren Young [darren@yhlsecurity.com]
#
# http://github.com/youngd24/LabInstall/tree/master/UBNT/EdgeRouter-X-Lite/scripts
#
################################################################################
#
# USAGE:
#
################################################################################
#
# KNOWN ISSUES:
#
################################################################################


################################################################################
# IMPORTS
################################################################################



################################################################################
# GLOBAL VARIABLES
################################################################################

# The various ER-X (Vyatta) stuffz
$vbash    = "/bin/vbash"
$vpath    = "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
$vwrapper = "/opt/vyatta/sbin/vyatta-cfg-cmd-wrapper"




################################################################################
# MAIN
################################################################################
