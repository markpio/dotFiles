#!/bin/bash

dir=~/dotFiles
os=`uname`
shellSettings=null

echo "Installing packages..."
sudo apt-get install vim ssh nitrogen xcompmgr

#For building i3-gaps
sudo apt-get install libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf libxcb-xrm0 libxcb-xrm-dev automake
    

if [ -e ~/.vimrc ]; then
    if [ ! -h ~/.vimrc ]; then
        mv ~/.vimrc ~/.vimrc-original
    fi
fi

if [ -e ~/.gitconfig ]; then
    if [ ! -h ~/.gitconfig ]; then
        mv ~/.vimrc ~/.vimrc-original
    fi
fi

rm -rf ~/.vim
ln -s $dir/vim ~/.vim
ln -s $dir/vimrc ~/.vimrc
ln -s $dir/gitconfig ~/.gitconfig

cd $dir/vim
git submodule init
git submodule update
