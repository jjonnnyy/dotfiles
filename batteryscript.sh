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
        notify-send -u critical "HIBERNATING DUE TO LOW BATTERY"
		sudo pm-hibernate
		sleep 3m
	elif [ "$percent" -lt "25" ]; then
		# If below 25% alert user
        echo "<fc=#FF0000>LOW BATTERY CHARGE NOW</fc>" > .chargenow
		notify-send -u critical "LOW BATTERY PLUG IN NOW"
		sleep 2m
    elif [ "$percent" -lt "60" ]; then
		# If below 50% check more regularly
		notify-send -u low "Battery at $percent%"
		sleep 8m
	else
		# Else above 50% wait awhile
        echo "" > .chargenow        
		sleep 16m
	fi
done
