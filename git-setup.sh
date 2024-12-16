git config --global push.default simple
git config --global pull.rebase true

if [ -z "$1" ] ; then
  read -p "User name: " USERNAME
else
  USERNAME="$1"
fi

if [ -z "$2" ] ; then
  read -p "User email: " USEREMAIL
else
  USERMAIL="$2"
fi

git config --global user.name "${USERNAME-'Krzysztof Kapusta'}"
git config --global user.email "${USEREMAIL-'krz.kapusta@gmail.com'}"
git config --global log.follow true
git config --global help.autocorrect 1
git config --global diff.tool vimdiff
git config --global --add difftool.prompt false
git config --global merge.tool vimdiff

git config --global alias.tree "log --graph --color --decorate --format=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --branches --remotes"
git config --global alias.htree '!git tree | head -20'
git config --global alias.reorder 'rebase -i origin/HEAD'
