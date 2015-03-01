#! /bin/bash

rm ~/.314dns/alive 2> /dev/null
touch ~/.314dns/alive

## Ping the subnet and determine what IP's are alive
## Afterwards we can use this information to further determine which of those
## alive IP's belong to student Lab machines

	echo "Pinging all IP's in given range..."
	for a in {134..134} ;do \
	for b in {7..7} ;do \
	for c in {44..47} ;do \
	## C'mon, only fork 255 processes at a time pls, 
	## anything else is just rude,
	## and will likely give you a RESOURCE BUSY
		sleep 1
		for d in {0..255} ;do \
			(ping $a.$b.$c.$d -c 1 -w 1 > /dev/null && echo $a.$b.$c.$d >> ~/.314dns/alive &)

	done; done; done; done;

	## Give the processes time to finish
	sleep 1

	## Sort the results, they will come somewhat randomly otherwise
	echo "Sorting results by IP..."
	cat ~/.314dns/alive | sort > ~/.314dns/sortedalive
	COUNT="$(cat ~/.314dns/alive | grep -c 134)"
	echo "Done sorting" 
	echo "$COUNT hosts alive"
	sleep 1

	echo "Checking which are lab machines...This may take some time....."
	echo "Ensure that you have cleared your ~/.ssh/known_hosts if you have issues here with BREAK-IN ATTEMPT errors"
	echo "You have 5 seconds to ctrl-c if you do not have public key-auth set up"
	sleep 5
	##SORRY_NOTSORRY
	FILE="~/.314dns/sortedalive"
	while read line; do
		(ssh "$line" -o 'StrictHostKeyChecking no' '/bin/bash labdnsdns/whatami.sh' &)
		printf "."
	done < $FILE
	printf "\n"

	sleep 5
	cat ~/.314dns/Results.csv | sort > ~/.314dns/SortedResults.csv

exit

## for i in {1..254} ;do (ping 192.168.1.$i -c 1 -w 5  >/dev/null && echo "192.168.1.$i" &) ;done
