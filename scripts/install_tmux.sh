#!/bin/bash

sudo apt-get install tmux

if [ -e ~/.tmux.conf ]; then
    if [ ! -h ~/.tmux.conf ]; then
        mv ~/.tmux.conf ~/.tmux.conf-original
    fi
fi

ln -s ~/dotFiles/tmux.conf ~/.tmux.conf
