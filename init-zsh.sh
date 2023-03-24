#!/usr/bin/env bash

set -ex

brew install git curl wget zsh node python
sudo chsh -s `command -v zsh` $USER
touch ~/.zshrc
sudo chown $USER ~/.zshrc

## due to `python` require in `apt-vim` will block in macOS Ventura, 
## skip install plugin by scripts, only use vimrc.
##   curl -sSL -H 'Cache-Control: no-cache' https://github.com/zthxxx/TianVimrc/raw/master/install.sh | bash
curl -SL# git.io/tvimrc -o ~/.vimrc

curl -sSL -H 'Cache-Control: no-cache' https://github.com/zthxxx/jovial/raw/master/installer.sh | sudo -E bash -s ${USER:=`whoami`}
