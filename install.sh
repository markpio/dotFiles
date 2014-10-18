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

echo "Making symlink to new vimrc..."
ln -s $dir/vimrc ~/.vimrc

if [ "$shellSettings" != "null" ]; then

    if [ -e ~/.$shellSettings ]; then
        if [ ! -h ~/.$shellSettings ]; then
            echo "Backing up old $shellSettings file and installing symlink..."
            mv ~/.$shellSettings ~/.$shellSettings-original
        fi
    fi

    echo "Making symlink to new $shellSettings"
    ln -s $dir/$shellSettings ~/.$shellSettings
fi

echo "Installing vim color scheme..."

if [ ! -d "~/.vim/colors" ]; then
    mkdir -p ~/.vim/colors/
fi

cp wombat256.vim ~/.vim/colors
