#!/bin/sh

# A dwm_bar function to show the master volume of ALSA
# Joe Standring <git@joestandring.com>
# GNU GPLv3

# Dependencies: alsa-utils

dwm_alsa () {
    VOL=$(amixer get Master | tail -n1 | sed -r "s/.*\[(.*)%\].*/\1/")
    NOTMUTE=$(amixer get Master | tail -n1 | sed -r "s/.*\[(.*)\].*/\1/")
    printf "%s" "$SEP1"
    if [ "$IDENTIFIER" = "unicode" ]; then
    	if [ "$NOTMUTE" = "off" ]; then
            printf "婢 %s%%" "$VOL"
        elif [ "$VOL" -eq 0 ]; then
            printf "奄 %s%%" "$VOL"
        elif [ "$VOL" -gt 0 ] && [ "$VOL" -le 33 ]; then
            printf "奔 %s%%" "$VOL"
        elif [ "$VOL" -gt 33 ] && [ "$VOL" -le 66 ]; then
            printf "墳 %s%%" "$VOL"
        else
            printf " %s%%" "$VOL"
        fi
    else
    	if [ "$NOTMUTE" = "off" ]; then
            printf "MUTE %s%%" "$VOL"
        elif [ "$VOL" -gt 0 ] && [ "$VOL" -le 33 ]; then
            printf "VOL %s%%" "$VOL"
        elif [ "$VOL" -gt 33 ] && [ "$VOL" -le 66 ]; then
            printf "VOL %s%%" "$VOL"
        else
            printf "VOL %s%%" "$VOL"
        fi
    fi
    printf "%s\n" "$SEP2"
}

