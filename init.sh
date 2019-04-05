#!/usr/bin/env bash

ruby -e "$(curl -fsSL git.io/brew-install)"

workspace="`pwd`"
# sudo -i sudo -u $USER -i "`pwd`/init.sh" "`pwd`"
if [[ -n $1 ]]; then 
    workspace="$1"
    cd "$workspace"
fi



sudo -i sudo -u $USER -i "${workspace}/init-proxy.sh"
sudo -i sudo -u $USER -i "${workspace}/init-zsh.sh"
zsh init-application.sh
zsh init-sys-preference.sh
zsh init-app-preference.sh
