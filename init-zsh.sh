#!/usr/bin/env bash

set -ex

brew install zsh
sudo chsh -s `command -v zsh` $USER

curl -sSL -H 'Cache-Control: no-cache' git.io/tvimrc -o ~/.vimrc
curl -sSL -H 'Cache-Control: no-cache' git.io/jovial | sudo bash -s $USER
