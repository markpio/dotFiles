#!/bin/bash

dir=~/dotFiles

echo "Installing packages..."
sudo apt-get install gnome-panel vim vim-gtk

if [ -f ~/.vimrc ]; then
    echo "Backing up old vimrc file..."
    mv ~/.vimrc ~/.vimrc-original
fi

echo "Making symlink to new vimrc..."
ln -s $dir/vimrc ~/.vimrc

echo "Backing uip old bashrc file and installing symlink..."
mv ~/.bashrc ~/.bashrc-original
ln -s $dir/bashrc ~/.bashrc

echo "Installing vim color scheme..."

if [ ! -d "~/.vim/colors" ]; then
    mkdir -p ~/.vim/colors/
fi

cp wombat256.vim ~/.vim/colors
