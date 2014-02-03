#!/bin/bash

dir=~/dotFiles

echo "Installing vim-gtk..."
sudo apt-get install vim vim-gtk

echo "Backing uip old vimrc file and installing symlink..."
mv ~/.vimrc ~/.vimrc-original
ln -s $dir/vimrc ~/.vimrc

echo "Backing uip old bashrc file and installing symlink..."
mv ~/.bashrc ~/.bashrc-original
ln -s $dir/bashrc ~/.bashrc

echo "Installing vim color scheme..."

if [ ! -d "~/.vim/colors" ]; then
    mkdir -p ~/.vim/colors/
fi

cp wombat256.vim ~/.vim/colors
