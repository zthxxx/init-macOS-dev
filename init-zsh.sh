#!/usr/bin/env bash

set -ex

brew install git curl wget zsh
sudo chsh -s `command -v zsh` $USER
touch ~/.zshrc
sudo chown $USER ~/.zshrc

curl -sSL -H 'Cache-Control: no-cache' https://github.com/zthxxx/TianVimrc/raw/master/install.sh | bash
curl -sSL -H 'Cache-Control: no-cache' git.io/jovial | sudo bash -s $USER
