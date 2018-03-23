#!/usr/bin/env bash

curl -sSL git.io/tvimrc -o ~/.vimrc
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
cp philoso.zsh-theme "~/.oh-my-zsh/custom/philoso.zsh-theme"
sed  -i '' 's/^ZSH_THEME=.*/ZSH_THEME="philoso"/g' .zshrc

if [ `basename "$SHELL"` != "zsh" ]; then
    chsh -s /bin/zsh
fi
