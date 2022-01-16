#!/bin/sh

if [ -z $1 ]; then
	echo "Usage: $0 <name of hidden scratchpad window>"
	exit 1
fi
#check if it's  already running    
id=$(xdo id -n ${1});
if [ -z "$id" ] ; then
	#alacritty --config-file $HOME/.config/alacritty/dropdown.yml --class dropdown,dropdown;
	pids=$(xdotool search --class ${1})
	for pid in $pids; do
		echo "Toggle $pid"
		bspc node $pid --flag hidden -f
	done

else

	pids=$(xdotool search --class ${1})
	for pid in $pids; do
#		echo "Toggle $pid"
		bspc node $pid --flag hidden -f
	done
fi
