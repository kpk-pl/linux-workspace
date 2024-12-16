#!/bin/bash

WHO=
if [[ "$EUID" -ne 0 ]] ; then
  WHO=sudo
fi

wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | $WHO apt-key add -

echo "deb http://apt.llvm.org/focal/ llvm-toolchain-focal main" >> /etc/apt/sources.list
echo "deb-src http://apt.llvm.org/focal/ llvm-toolchain-focal main" >> /etc/apt/sources.list
echo "deb http://apt.llvm.org/focal/ llvm-toolchain-focal-15 main" >> /etc/apt/sources.list
echo "deb-src http://apt.llvm.org/focal/ llvm-toolchain-focal-15 main" >> /etc/apt/sources.list

apt-get update
apt-get install -y clang clang-tidy-15
