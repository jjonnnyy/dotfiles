#!/bin/sh
while :
do
	# load battery state
	charge_now=`cat /sys/class/power_supply/BAT1/charge_now`
	charge_full=`cat /sys/class/power_supply/BAT1/charge_full`
	percent=$[$charge_now*100/$charge_full]
	# load charging state
	pluggedin=`cat /sys/class/power_supply/BAT1/status`

if [ "$pluggedin" != "Discharging" ]; then
		# Check first if charging
        echo "" > .chargenow
		sleep 5m
	elif [ "$percent" -lt "15" ]; then
		# If below 15% hibernate
        echo "<fc=#FF0000>HIBERNATING DUE TO LOW BATTERY</fc>" > .chargenow
		sudo pm-hibernate
		sleep 3m
	elif [ "$percent" -lt "25" ]; then
		# If below 25% alert user
		echo "<fc=#FF0000>LOW BATTERY CHARGE NOW</fc>" > .chargenow 
        sleep 2m	
	else
		# Else above 50% wait awhile
		echo "" > .chargenow
        sleep 15m
	fi
done
