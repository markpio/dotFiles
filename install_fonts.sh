#!/bin/bash

./vim/powerline-fonts/install.sh
gconftool-2 --set /apps/gnome-terminal/profiles/Default/font --type string "Ubuntu Mono derivative Powerline 12"
sed -i 's/\"\(let g:airline_powerline_fonts = 1\)/\1/g' vimrc
