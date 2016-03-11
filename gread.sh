#!/bin/bash
if ! [ -f ~/.gread/${1}.mp3 ]; then

    if ! [ -d ~/.gread ]; then
        mkdir ~/.gread
    fi

    l416=`curl -s http://www.iciba.com/${1} | grep '<span>美'`
    u1=${l416#*displayAudio(\'}
    u2=${u1%%\')\"*}
    cd ~/.gread
    wget -q -P "~/.gread" -O "${1}.mp3" "$u2"

fi

mplayer "~/.gread/${1}.mp3" >/dev/null 2>/dev/null &

