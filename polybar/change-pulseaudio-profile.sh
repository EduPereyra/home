#!/bin/sh
CARD="<alsa_card.usb-0b0e_Jabra_Link_370_745C4BE1EB51013200-00>"
MUSIC_PROFILE="<output:iec958-stereo>"
CALL_PROFILE="<output:iec958-stereo+input:multichannel-input>"

profile_print() {
    if [ "$(pacmd list-cards | grep 'alsa_card.usb-0b0e_Jabra_Link_370_745C4BE1EB51013200-00' | cut -d ' ' -f 2)" = "$CARD" ]; then
#	printf 'CONNECTED\n'
	PROFILE=$(pacmd list-cards | grep -A 35 'alsa_card.usb-0b0e_Jabra_Link_370_745C4BE1EB51013200-00' | grep "active" | cut -d ' ' -f 3)
	
	case "$PROFILE" in
		$MUSIC_PROFILE)
			printf ''
			;;
		$CALL_PROFILE)
			printf ''
			;;
		*)
			printf ''
			;;
	esac
    else
	printf '' 
    fi
}

profile_toggle() {
	
	if [ "$(pacmd list-cards | grep -A 35 'alsa_card.usb-0b0e_Jabra_Link_370_745C4BE1EB51013200-00' | grep "active" | cut -d ' ' -f 3)" = "$MUSIC_PROFILE" ];then
	       	pactl set-card-profile alsa_card.usb-0b0e_Jabra_Link_370_745C4BE1EB51013200-00 output:iec958-stereo+input:multichannel-input
		notify-send --urgency=low --expire-time=900 "Calls Profile"

	else
		pactl set-card-profile alsa_card.usb-0b0e_Jabra_Link_370_745C4BE1EB51013200-00 output:iec958-stereo	
		notify-send --urgency=low --expire-time=900 "Music Profile"
	fi
}

case "$1" in
    --toggle)
        profile_toggle
        ;;
    *)
        profile_print
        ;;
esac

