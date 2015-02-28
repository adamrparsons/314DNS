#!/bin/bash

	FILE="labdns/sortedalive"
	while read line; do
		(ssh "$line" -o 'StrictHostKeyChecking no' 'bash labdns/whatami.sh' &)
	done < $FILE
