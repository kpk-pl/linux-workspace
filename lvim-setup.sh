#!/bin/bash

sudo apt-get update
sudo apt-get install lua5.4 gettext

git clone https://github.com/neovim/neovim
cd neovim

mkdir .deps && cd .deps
cmake -DCMAKE_BUILD_TYPE=Release ../cmake.deps
make -j8
cd ..

mkdir build && cd build
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/local ..
sudo make -j8 install
cd ../../

sudo apt-get install -y npm nodejs cargo
sudo npm install tree-sitter-cli

LV_BRANCH='release-1.3/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.3/neovim-0.9/utils/installer/install.sh)
rm ~/.config/lvim/config.lua
ln -s $(pwd)/vim/config.lua ~/.config/lvim/config.lua

echo "Install Iosevka Term form from nerd-fonts https://github.com/ryanoasis/nerd-fonts/releases"
echo "Download the fonts and put them in a directory in ~/.fonts"
echo "Then run fc-cache -f -v"

echo "Inside lvim:"
echo ":TSInstall python"
