#!/bin/sh
# Statup Script (loads a few things but checks if running already first)

# Devmon
#ps -A | grep "devmon" > /dev/null
#if [ "$?" -eq "1" ]
#then
#	devmon &
#fi

# pcmanfm (for auto drive management)
#ps -A | grep pcmanfm > /dev/null
#if [ "$?" -eq "1" ]
#then
#	pcmanfm -d --no-desktop &
#fi

# Wicd-client
ps -A | grep wicd | grep client > /dev/null
if [ "$?" -eq "1" ]
then
	wicd-client -t &
fi

# Volumeicon
ps -A | grep "volumeicon" > /dev/null
if [ "$?" -eq "1" ]
then
	volumeicon &
fi

# Dropbox
#ps -A | grep "dropbox" > /dev/null
#if [ "$?" -eq "1" ]
#then
#	(sleep 10 && dropboxd) &
#fi

# SabNZBD
sabnzbd -d &

# CouchPotato
# couchpotato -d --datadir=~/.config/couchpotato &

xcompmgr &

# Conky
pkill conky
(sleep 5 && conky) &

# My battery monitoring script
ps -A | grep "batteryscript" > /dev/null
if [ "$?" -eq "1" ]
then
	./.batteryscript.sh &
fi

