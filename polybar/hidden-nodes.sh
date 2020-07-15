#!/bin/bash

counter=0
ids=($(bspc query -N -n .hidden.window)) 
for wid in "${ids[@]}"; do
	counter=$((counter + 1))
done
#counter=0
if [ $counter -gt 0 ]; then
	echo $counter
else
	echo "0"
fi
