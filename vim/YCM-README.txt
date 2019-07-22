To compile and install YCM:
git submodule update --init --recursive
sudo apt-get install python-dev python-pip
./install.py --clang-completer --system-libclang

Maybe add --system-boost if boost is available
