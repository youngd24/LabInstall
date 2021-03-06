#!/bin/bash
###############################################################################
#
###############################################################################


###############################################################################
TEMP=`getopt -o dl: --long d-long,l-long: \
     -n $MYNAME -- "$@"`

if [ $? != 0 ] ; then echo "$MYNAME: terminating..." >&2 ; exit 1 ; fi

eval set -- "$TEMP"

while true ; do
    case "$1" in
        -d|--d-long) echo "Debug enabled" ; DEBUG="true"; shift ;;
        -l|--l-long)
            case "$2" in
                "") echo "Option l, no argument"; shift 2 ;;
                *) LOGFILE=$2 ; shift 2 ;;
            esac ;;
        --) shift ; break ;;
        *) echo "Internal error!" ; exit 1 ;;
    esac
done

debug "Logfile: $LOGFILE"
echo "Script: $MYNAME started"
echo "Script: $MYNAME done"
