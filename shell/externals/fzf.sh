#!/bin/bash

read -n1 -p "Uninstall first? [y/n]: " answer
if [[ "$answer" == y ]] && [ -f ~/.fzf/uninstall ] ; then
  ~/.fzf/uninstall
fi

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

echo "Key bindings:
Ctrl+T: Paste selected files to cmdline
Ctrl+R: Paste selected command from history
Alt+C: Cd into directory

Available commands:
vim **<Tab>
cd **<Tab>
kill <Tab>
ssh **<Tab>"
