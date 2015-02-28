#!/bin/bash

sleep 1
ADD="`cat /sys/class/net/eth0/address`"
IP="$(/sbin/ifconfig | /usr/bin/awk '/inet addr/{print substr($2,6)}' | /bin/grep 134)"
RES="$(/bin/cat labdns/list.csv | /bin/grep $ADD)" 
HOSTNAME="$(labdns/csv $RES)"
MAC="$(labdns/csv2 $RES)"
/bin/echo "$HOSTNAME,$IP" >> labdns/Results.csv
