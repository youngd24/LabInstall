#!/bin/bash

typeset -f hfNetChk



#
if [ -f /etc/redhat-release ]; then
    echo "You are on RedHat/Centos, this script is for Raspbian"
    exit 1
else 
    echo "NOT running on RedHat/CentOS, good"
fi

#
DIST=`/usr/bin/lsb_release -i | awk '{print $3}'`
if [ ! $DIST == "Raspbian" ]; then
    echo "While you appear to be on a Deb dist, it's not Raspbian, sorry"
    exit 1
else 
    echo "Running on Raspbian, good"
fi








# function to check if eth0 is on the correct internal subnet
# this means DHCP worked and we're off the 169.254 net
hfNetChk () {
    echo "hfChkNet: checking network"
    IP=`ifconfig eth0 | grep inet | grep -v inet6 | awk '{print $2}' | grep -q -F "192.168"`
    ret=$?
    return $ret
}

# check for successful DHCP on the 192.168 net
# if so move on, else try again up to some number of times
x=0
maxNetRetries=5
netChkSleepTime=.5

while ! hfNetChk
do
    if [ "$x" -ge $maxNetRetries ]; then
        echo "timed out"
        exit 47
    else
        x=$((x+1))
        sleep $netChkSleepTime
    fi
done
