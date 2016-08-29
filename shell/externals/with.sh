#!/bin/bash

target=~/.scripts/addedToPath/with
curl -s https://raw.githubusercontent.com/mchav/with/master/with -o $target && chmod +x $target
