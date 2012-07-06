#!/bin/sh
while :
do
	# load battery state
	percent=`acpi | grep -o '[0-9]\+%' | grep -o '[0-9]\+'`
	# load charging state
	pluggedin=`cat /sys/class/power_supply/BAT0/status`

if [ "$pluggedin" != "Discharging" ]; then
		# Check first if charging
        sleep 5m
	elif [ "$percent" -lt "15" ]; then
		# If below 15% hibernate
        notify-send -u critical "HIBERNATING DUE TO LOW BATTERY"
		sudo pm-hibernate
		sleep 3m
	elif [ "$percent" -lt "25" ]; then
		# If below 25% alert user
		notify-send -u critical "LOW BATTERY PLUG IN NOW"
		sleep 2m
    elif [ "$percent" -lt "60" ]; then
		# If below 50% check more regularly
		#notify-send -u low "Battery at $percent%"
		sleep 8m
	else
		# Else above 50% wait awhile
		sleep 16m
	fi
done
