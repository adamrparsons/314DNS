#!/bin/bash

#Will likely work on any of the Red Hat lab machines, and I dare say anything else with linux on it. one day when systemD gets installed you may need to change the interface name
ADD="`cat /sys/class/net/eth0/address`"
if [$# -ne 1]; 
	then echo "illegal number of parameters"
fi
if [$# -eq 1];
	then echo "$1,$ADD" >> ~/.314dns/hosts.csv
fi



