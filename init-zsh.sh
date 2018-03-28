#!/usr/bin/env bash

if [ `basename "$SHELL"` != "zsh" ]; then
    chsh -s /bin/zsh
fi

curl -sSL git.io/tvimrc -o ~/.vimrc
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
curl -sSL git.io/jovial | zsh
