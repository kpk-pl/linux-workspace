#!/bin/bash

apt-get install -y lsb-release wget software-properties-common gnupg
wget -qO- https://apt.llvm.org/llvm.sh | bash -s -- 18
ln -s /usr/bin/clangd-18 /usr/bin/clangd
