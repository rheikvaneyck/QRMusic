#!/bin/bash
# Listing 6
AUDIODEV=hw:0
while true
do
        read qr
        read qr2
        if [[ "$qr" =~ ^QR ]]; then
                artist=`echo $qr | cut -d':' -f 3`
                echo "artist: $artist"
                album=`echo $qr2 | cut -d':' -f 2-`
                echo "album: $album"
                if [[ "$album" =~ ^http ]]; then
                        killall zbarcam
                        xmms2 stop
                        xmms2 clear
                        xmms2 add $album
                        play -q /home/pi/source/rbar/ok.wav
                        xmms2 play
                        exit
                        s=""
                else
                        s=`xmms2 search album:"$album" | egrep -e "$album"`
                fi
                if [[ -n "$s" ]]; then
                        killall zbarcam
                        xmms2 stop
                        xmms2 clear
                        xmms2 add album:"$album" -o "tracknr"
                        play -q /home/pi/source/rbar/ok.wav
                        xmms2 play
                        exit
                else
                        xmms2 stop
                        play -q /home/pi/source/rbar/no.wav
                fi
                sleep 5
        fi
done
