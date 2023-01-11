#!/bin/bash

VERSION=2.2.2
DIR=iosevka-nerdfonts-$VERSION
PACK=Iosevka.zip

[[ -d ~/.fonts ]] || mkdir ~/.fonts
[[ -d $DIR ]] || mkdir $DIR

curl -# -L https://github.com/ryanoasis/nerd-fonts/releases/download/v${VERSION}/${PACK} -o ${PACK} || exit 1
yes A | unzip -d $DIR $PACK
rm $PACK

mv $DIR ~/.fonts

echo "Updating fonts cache"
fc-cache -fv

echo "You can now change terminal font to iosevka nerdfonts"
