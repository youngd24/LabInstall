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


###############################################################################
#                                 B E G I N
###############################################################################
sub BEGIN {

    require 5.10.0;

    use lib "/opt/vyatta/share/perl5";
    use warnings;
    use strict;

    use Vyatta::Config;
    use Vyatta::IpTables::Rule;
    use Vyatta::IpTables::AddressFilter;
    use Vyatta::IpTables::Mgr;
    use Getopt::Long;
    use Vyatta::Zone;
    use Sys::Syslog qw(:standard :macros);


    # "Standard" modules we use
    use File::Basename ();
    use Switch;
    our $NAME = File::Basename::basename($0);
};


################################################################################
#                        G L O B A L   V A R I A B L E S
################################################################################

# The various ER-X (Vyatta) stuffz
$base     = "/opt/vyatta";
$vbash    = "/bin/vbash";
$vpath    = "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin";
$vwrapper = "/opt/vyatta/sbin/vyatta-cfg-cmd-wrapper";




################################################################################
#                           M A I N   S C R I P T
################################################################################











##############################################################################
#                              F U N C T I O N S
##############################################################################
