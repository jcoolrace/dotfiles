#!/bin/bash

site=$(cat $DOTFILES/notes/websites.txt | dmenu -p 'Enter a URL:' -i -l 10 -nb "#303030" -nf "#ffffff" -sb "#ffffff" -sf "#303030" -fn "HelveticaNeue-11")
if [ "$?" == "0" ]; then firefox --new-window $(echo $site | sed "s/\[.*\] //"); fi
