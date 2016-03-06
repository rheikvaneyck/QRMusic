#!/bin/bash
# Listing 6
APPDIR=$(dirname $(readlink -f $0))
AUDIODEV=hw:0
while true
do
        read qr
        read qr2
            artist=$(echo $qr | cut -d':' -f 2-)
            echo "artist: $artist"
            album=$(echo $qr2 | cut -d':' -f 2-)
            echo "album: $album"
            if [[ "$album" =~ ^http ]]; then
                    ( killall zbarcam )
                    xmms2 stop
                    xmms2 clear
                    xmms2 add $album
                    ( aplay -q ${APPDIR}/ok.wav )
                    xmms2 play
                    exit
                    s=""
            else
                    s=$(xmms2 search album:"$album" tracknr:1 | egrep -e "$album")
            fi
            if [[ -n "$s" ]]; then
                    ( killall zbarcam )
                    xmms2 stop
                    xmms2 clear
                    xmms2 add album:"$album" -o "tracknr"
                    ( aplay -q ${APPDIR}/ok.wav )
                    xmms2 play
                    exit
            else
                    xmms2 stop
                    ( aplay -q ${APPDIR}/no.wav )
            fi
            sleep 5
done
