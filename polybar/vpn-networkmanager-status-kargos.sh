#!/bin/sh

vpn="$(nmcli -t -f name,type connection show --order name --active 2>/dev/null | grep vpn | head -1 | cut -d ':' -f 1)"

if [ -n "$vpn" ]; then
	echo "$vpn | kargos.fa_icon=globe size=9 "
	#echo "Hello world! | kargos.fa_icon=globe size=12";
else
	echo "vpn down | kargos.fa_icon=globe size=9 "
fi
