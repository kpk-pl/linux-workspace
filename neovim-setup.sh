#!/bin/bash

git clone https://github.com/neovim/neovim
cd neovim

make CMAKE_BUILD_TYPE=Release CMAKE_INSTALL_PREFIX=/usr/local

if [[ "$EUID" -eq 0 ]] ; then
  make -j4 install
else
  sudo make -j4 install
fi

if [[ -d "$PWD/vim" ]] ; then
  mkdir -p ~/.config/nvim
  ln -s "$PWD/vim/init.vim" ~/.config/nvim/init.vim
fi

mkdir -p ~/.local/share/nvim/mason/packages/clangd
mkdir -p ~/.local/share/nvim/mason/bin/
ln -s /usr/bin/clangd-12 ~/.local/share/nvim/mason/bin/clangd
