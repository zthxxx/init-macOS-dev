#!/usr/bin/env bash

set -ex

if command -v brew; then
    brew update -v
    rm -rf "$(brew --cache)"
else
    # https://github.com/Homebrew/install/tree/master
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi


workspace="`pwd`"
# sudo -i sudo -u $USER -i "`pwd`/init.sh" "`pwd`"
if [[ -n $1 ]]; then 
    workspace="$1"
    cd "$workspace"
fi


function install_flow {
    # bash "${workspace}/init-proxy.sh"
    bash "${workspace}/init-zsh.sh"

    zsh init-application.sh
    zsh init-sys-preference.sh
    zsh init-app-preference.sh
}

install_flow  2>&1 | tee install.log
