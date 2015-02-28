#! /bin/bash

rm labdns/alive > /dev/null

## Ping the subnet and determine what IP's are alive
## Afterwards we can use this information to further determine which of those
## alive IP's belong to student Lab machines

	echo "Pinging all IP's in given range"
	for a in {134..134} ;do \
	for b in {7..7} ;do \
	for c in {44..47} ;do \
	## C'mon, only fork 255 processes at a time pls, anything else is just rude,
	## and will likely give you a RESOURCE BUSY
		sleep 1
		for d in {0..255} ;do \
			(ping $a.$b.$c.$d -c 1 -w 1 > /dev/null && echo $a.$b.$c.$d >> labdns/alive &)

	done; done; done; done;

	sleep 1
	cat labdns/alive | sort > labdns/sortedalive
	COUNT="$(cat labdns/alive | grep -c 134)" 
	echo "$COUNT hosts alive"

	echo "Checking which are lab machines"
	##SORRY_NOTSORRY
	##arp -a > arplist

	FILE="labdns/sortedalive"
	while read line; do
		(ssh "$line" -o 'StrictHostKeyChecking no' '/bin/bash labdns/whatami.sh' &)
	done < $FILE

	sleep 2
	cat labdns/Results.csv | sort > labdns/SortedResults.csv

exit

## for i in {1..254} ;do (ping 192.168.1.$i -c 1 -w 5  >/dev/null && echo "192.168.1.$i" &) ;done