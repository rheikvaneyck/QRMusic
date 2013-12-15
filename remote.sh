#!/bin/bash
# Listing 5
AUDIODEV=hw:0
arg="$1"
case $arg in
"power")
        zbarcam --nodisplay -Sdisable -Sqrcode.enable --prescale=320x240 /dev/video0 | /home/pi/rbar.sh
        ;;
"next")
        echo "Next Song"
        xmms2 next

        ;;
"prev")
        echo "Previous Song"
        xmms2 prev
        ;;
"volup")
        echo "volume 5 up"
        xmms2 server volume +5
        ;;
"voldown")
        echo "volume 5 down"
        xmms2 server volume -5
        ;;
"play")
        echo "toggle playback"
        xmms2 toggle
        status=`xmms2 current`
        if [[ "$status" =~ ^Paused ]]; then
                play -q /home/pi/no.wav
        fi
        ;;
esac
