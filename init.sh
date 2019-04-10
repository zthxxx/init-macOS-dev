#!/usr/bin/env bash

if ! command -v brew; then
    ruby -e "$(curl -fsSL git.io/brew-install)"
fi

brew install expect

workspace="`pwd`"
# sudo -i sudo -u $USER -i "`pwd`/init.sh" "`pwd`"
if [[ -n $1 ]]; then 
    workspace="$1"
    cd "$workspace"
fi


function install_flow {
    unbuffer bash "${workspace}/init-proxy.sh"
    unbuffer bash "${workspace}/init-zsh.sh"

    unbuffer zsh init-application.sh
    unbuffer zsh init-sys-preference.sh
    unbuffer zsh init-app-preference.sh
}

install_flow | tee install.log
