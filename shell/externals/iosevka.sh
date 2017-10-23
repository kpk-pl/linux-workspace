#!/bin/bash

VERSION=1.13.3
DIR=iosevka-$VERSION
PACK=02-iosevka-term-$VERSION.zip

[[ -d ~/.fonts ]] || mkdir ~/.fonts
[[ -d $DIR ]] || mkdir $DIR

curl -# -L https://github.com/be5invis/Iosevka/releases/download/v$VERSION/$PACK -o $PACK || exit 1
yes A | unzip -d $DIR $PACK
rm $PACK

mv $DIR ~/.fonts

echo "Updating fonts cache"
sudo fc-cache -fv
