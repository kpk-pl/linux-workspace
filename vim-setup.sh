#!/bin/bash

[[ -s ~/.vim ]] && unlink ~/.vim
[[ -s ~/.vimrc ]] && unlink ~/.vimrc

[[ -e ~/.vim ]] && { echo "~/.vim exists!" ; exit 1; }
[[ -e ~/.vimrc ]] && { echo "~/.vimrc exists" ; exit 1; }

ln -s "$PWD/vim/vim" ~/.vim
ln -s "$PWD/vim/vimrc" ~/.vimrc

