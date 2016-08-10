#!/bin/bash

sudo apt-get install fish
ln -s ~/dotFiles/config.fish ~/.config/fish/config.fish
chsh -s `which fish` $USERNAME
