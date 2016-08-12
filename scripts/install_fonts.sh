#!/bin/bash

./vim/powerline-fonts/install.sh
gconftool-2 --set /apps/gnome-terminal/profiles/Default/font --type string "Ubuntu Mono derivative Powerline 12"
./enable_airline_fonts.sh
