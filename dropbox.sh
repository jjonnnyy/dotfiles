#!/bin/bash

# While there is a connection, the script checks every 60 secs if 
# the dropbox status is "Dropbox isn't running" or "Connecting",
# and if so, it reconnects the service. Could start from .xinitrc.

while true; do
	ping -c 1 www.google.com 1>/dev/null 2>/dev/null
	if [ "$?" = 0 ]; then
		dropbox status | egrep 'isn|Connecting'>/dev/null
		if [ "$?" = 0 ]; then
			dropbox stop
			dropbox start
		fi
 	fi
	sleep 60
done
