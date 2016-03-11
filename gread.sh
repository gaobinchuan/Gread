#!/bin/bash
if ! [ -f ${HOME}/.gread/${1}.mp3 ]; then

    if ! [ -d ${HOME}/.gread ]; then
        mkdir ${HOME}/.gread
    fi

    l416=`curl -s http://www.iciba.com/${1} | grep '<span>美'`
    u1=${l416#*displayAudio(\'}
    u2=${u1%%\')\"*}
    cd ${HOME}/.gread
    wget -q -P "${HOME}/.gread" -O "${1}.mp3" "$u2"

fi

mplayer "${HOME}/.gread/${1}.mp3" 1>/dev/null 2>/dev/null &

