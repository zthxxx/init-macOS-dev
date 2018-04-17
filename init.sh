#!/usr/bin/env bash

ruby -e "$(curl -fsSL git.io/brew-install)"

. ./init-zsh.sh
. ./init-proxy.sh
zsh init-application.sh
zsh init-sys-preference.sh
