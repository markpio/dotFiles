#!/bin/bash

dir=~/dotFiles

echo "Installing packages..."
sudo apt-get install gnome-panel vim vim-gtk compizconfig-settings-manager ssh

if [ -f ~/.vimrc ]; then
    if [ ! -h ~/.vimrc ]; then
        echo "Backing up old vimrc file..."
        mv ~/.vimrc ~/.vimrc-original

        echo "Making symlink to new vimrc..."
        ln -s $dir/vimrc ~/.vimrc
    fi
fi

if [ ! -h ~/.bashrc ]; then
    echo "Backing uip old bashrc file and installing symlink..."
    mv ~/.bashrc ~/.bashrc-original

    echo "Making symlink to new bashrc"
    ln -s $dir/bashrc ~/.bashrc
fi


echo "Installing vim color scheme..."

if [ ! -d "~/.vim/colors" ]; then
    mkdir -p ~/.vim/colors/
fi

cp wombat256.vim ~/.vim/colors
