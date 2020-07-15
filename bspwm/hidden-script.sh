#!/bin/env bash

ids=($(bspc query -N -n .hidden.window)) || exit
for wid in "${ids[@]}"; do
    title="$(xtitle "$wid")"
    options+="${title:-"$(bspc query -T -n "$wid" | jq -r '
        .client | "\(.instanceName):\(.className)"
    ')"}"$'\n'
done

id_index="$(<<< "$options" rofi -dmenu  -only-match -format i -p "hidden")"
bspc node "${ids[${id_index}]}" -g hidden=off -f
