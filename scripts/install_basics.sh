#!/bin/bash

dir=~/dotFiles
os=`uname`
shellSettings=null

if [ "$os" == "Linux" ]; then
    echo "Installing packages..."
    sudo apt-get install vim ssh
elif [ "$os" == "Darwin" ]; then
    shellSettings=profile
else
    echo "Unsupported OS"
fi

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
