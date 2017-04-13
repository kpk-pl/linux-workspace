#!/bin/bash

#PREREQUISITE: install ninja-build or generate compile_commands.json with cmake (CMAKE_EXPORT_COMPILE_COMMANDS=ON)
#cmake -G Ninja -DCMAKE_EXPORT_COMPILE_COMMANDS=ON IntellisellServer .
#copy compile_commands.json 

PROJECT="$1"
if ! [[ -d $PROJECT ]] ; then
    echo "You need to specify path to project"
    exit 1
fi

rtags/bin/rc -J $PROJECT 
