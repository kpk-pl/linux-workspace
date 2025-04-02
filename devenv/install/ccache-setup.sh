#!/bin/bash

git clone https://github.com/ccache/ccache.git && cd ccache
mkdir build && cd build
cmake -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_PREFIX=/usr
make -j8 && make install
ccache --max-size 4G
