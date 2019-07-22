git config --global push.default simple
git config --global pull.rebase true

read -p "User name: " USERNAME
read -p "User email: " USEREMAIL
git config --global user.name ${USERNAME-'Krzysztof Kapusta'}
git config --global user.email ${USEREMAIL-'krz.kapusta@gmail.com'}
git config --global log.follow true
git config --global help.autocorrect 1

git config --global alias.tree "log --graph --color --decorate --format=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --branches --remotes"
git config --global alias.htree '!git tree | head -20'
git config --global alias.reorder 'rebase -i origin/HEAD'
