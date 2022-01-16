#!/bin/sh

for i in $(bspc query -N -n .marked); do
	bspc config -n "$i" border_width 10
done
