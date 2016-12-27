#!/bin/bash

# PREREQUISITE: install cmake and llvm

cd rtags
cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1
make

echo "Add $(pwd -P)/bin to your PATH"
