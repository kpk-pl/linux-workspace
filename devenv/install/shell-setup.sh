#!/bin/bash

SOURCE_DIR=~/.scripts/sourcedInBashrc
PATH_DIR=~/.scripts/addedToPath

mkdir -p ~/.scripts
mkdir -p $SOURCE_DIR
mkdir -p $PATH_DIR

for s in /tmp/shell/source/{defaults,dirmanip-relative,history,man-colors,prompt,rebash} ; do
    if [[ -f "$s" ]] ; then
        mv "$s" $SOURCE_DIR
    fi
done

for p in /tmp/shell/path/git-review ; do
    mv ${p} $PATH_DIR
done

for script in /tmp/shell/externals/fzf.sh ; do
    $script
done

grep -q .scripts/sourcedInBashrc ~/.bashrc || \
    echo 'for f in '"$SOURCE_DIR"'/*; do source $f; done' >> ~/.bashrc

grep -q .scripts/addedToPath ~/.bashrc || \
    echo 'if ! [[ $PATH =~ '"$PATH_DIR"' ]] ; then PATH=$PATH:'"$PATH_DIR"' ; fi' >> ~/.bashrc

echo "export CLICOLOR=1" >> ~/.bash_profile
echo "export TERM=xterm-256color" >> ~/.bash_profile
echo "source /usr/share/bash-completion/completions/git" >> ~/.bash_profile
echo 'export GPG_TTY=$(tty)' >> ~/.bash_profile
echo "export LC_ALL=C.UTF-8" >> ~/.bash_profile

echo 'function build(){ if [[ -d ./build ]] ; then cmake --build ./build $@ ; elif [[ -d ../build ]] ; then cmake --build ../build $@ ; else cmake --build . $@ ; fi; }' >> ~/.bash_profile

echo 'if [[ $(ps -ef | grep "ssh-agent -s" | grep -v grep | wc -l) -eq 0 ]] ; then eval `ssh-agent -s`; ssh-add ~/.ssh/id_rsa; fi' >> ~/.bash_profile

sed -i '1s#^#source ~/.bash_profile\n#' ~/.bashrc
