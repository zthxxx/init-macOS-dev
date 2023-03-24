#!/usr/bin/env bash

function prepare_homebrew {
    if command -v brew; then
        echo "+ Update Homebrew"
        brew update -v
        rm -rf "$(brew --cache)"
    else
        echo "+ Install Homebrew"
        # https://github.com/Homebrew/install/tree/master
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)";
        
        if [[ ! -f ~/.config/.HomebrewEnvSetupDone ]]; then
            # `/opt/homebrew/bin/brew` in Apple Silicon device
            # `/usr/local/bin/brew` in Intel device
            brew_bin='/opt/homebrew/bin/brew'
            echo "+ brew bin path: ${brew_bin}"
            ${brew_bin} shellenv
            (echo; ${brew_bin} shellenv) >> ~/.zprofile >> ~/.bash_profile
            eval "$(${brew_bin} shellenv)"

            if command -v brew; then
                echo "+ Homebrew Installed"
                mkdir -p ~/.config
                touch ~/.config/.HomebrewEnvSetupDone
            else
                echo "+ [Error] Homebrew or environment variables setup failed, check: https://brew.sh"
                exit 1
            fi
        fi
    fi
}

prepare_homebrew


####################

set -ex

workspace="`pwd`"

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
