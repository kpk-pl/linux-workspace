#!/bin/bash

git clone https://github.com/neovim/neovim
cd neovim

make CMAKE_BUILD_TYPE=Release CMAKE_INSTALL_PREFIX=/usr/local
sudo make -j8 install

mkdir -p ~/.config/nvim
ln -s "$PWD/vim/init.vim" ~/.config/nvim/init.vim
