#!/usr/bin/env bash

set -ex


## due to `python` require in `apt-vim` will block in macOS Ventura, 
## skip install plugin by scripts, only use vimrc.
##   curl -sSL -H 'Cache-Control: no-cache' https://github.com/zthxxx/TianVimrc/raw/master/install.sh | bash
curl -SL# git.io/tvimrc -o ~/.vimrc

if [ ! -f ~/.local/share/chezmoi/.chezmoiroot ]; then
  git clone git@github.com:zthxxx/chezmoi-dotfiles.git ~/.local/share/chezmoi

  CHEZMOI_DEVICE=macos
  echo ${CHEZMOI_DEVICE} > ~/.local/share/chezmoi/.chezmoiroot

  # cannot add chezmoi's config file to chezmoi, so we need to create a symlink manually
  mkdir -p ~/.config/chezmoi
  ln -fsn ~/.local/share/chezmoi/chezmoi.${CHEZMOI_DEVICE}.yaml ~/.config/chezmoi/chezmoi.yaml

  chezmoi apply
fi

