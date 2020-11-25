#!/bin/bash

if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root" 
  exit 1
fi

# Disable annoying sounds on completion
sed -i 's/# set bell-style none/set bell-style none/' /etc/inputrc

# Setup pretty colors for files
wget https://raw.githubusercontent.com/seebi/dircolors-solarized/master/dircolors.ansi-light -O ~/.dircolors

# Manual things left to do
echo "Please use WSLTTY for terminal emulator"
echo "Setup font to Iosevka Term Medium size 10"
echo "Setup theme to gruvbox"
echo "Setup bell to no beep"
