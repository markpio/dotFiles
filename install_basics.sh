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
        echo "Backing up old vimrc file..."
        mv ~/.vimrc ~/.vimrc-original
    fi
fi
echo "Making symlink to vim files..."

rm -rf ~/.vim
ln -s $dir/vim ~/.vim
ln -s $dir/vimrc ~/.vimrc

cd $dir/vim
git submodule init
git submodule update
