#!/bin/bash

hostname=$(uname -n)

if [ "$hostname" == "lg-gram" ]; then
	# Display scaling
	export GDK_SCALE=2

	# Touchpad acceleration adjustment
	id=$(xinput list | grep -i "Touchpad" | grep -oP 'id=[0-9]*' | sed 's/id=//')
	property=$(xinput list-props "$id" | grep -i 'libinput Accel Speed (' | cut -d "(" -f2 | cut -d ")" -f1)
	accel="0.4"
	xinput set-prop "$id" "$property" "$accel"

	# Key press repeat timing
	xset r rate 250 40

	# Give some time for network connection, then check for updates
	sleep 10
	./pacman-i3.sh
fi
