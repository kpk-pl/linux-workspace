#!/bin/bash

SOURCE_DIR=~/.scripts/sourcedInBashrc
PATH_DIR=~/.scripts/addedToPath

mkdir -p ~/.scripts
mkdir -p $SOURCE_DIR 
mkdir -p $PATH_DIR

read -n1 -p "Erase previous install? [Y/n]" ans ; echo
[[ "$ans" == Y ]] && rm -rf $SOURCE_DIR/* $PATH_DIR/*

for s in shell/source/* ; do
    read -n1 -p "Source ${s##*/}? [Y/n]" ans ; echo
    [[ "$ans" == Y ]] && cp "$s" $SOURCE_DIR 
done

for p in shell/path/* ; do
    read -n1 -p "Add ${p##*/} to PATH? [Y/n]" ans ; echo
    [[ "$ans" == Y ]] && cp "$p" $PATH_DIR
done

grep -q .scripts/sourcedInBashrc ~/.bashrc || \
    echo 'for f in '"$SOURCE_DIR"'/*; do source $f; done' >> ~/.bashrc

grep -q .scripts/addedToPath ~/.bashrc || \
    echo 'if ! [[ $PATH =~ '"$PATH_DIR"' ]] ; then PATH=$PATH:'"$PATH_DIR"' ; fi' >> ~/.bashrc

