#!/usr/bin/env bash

PROJECT_NAME="init-macOS-dev"
SOURCE_URL="https://github.com/zthxxx/${PROJECT_NAME}/raw/master/"

is_command() { command -v $@ &> /dev/null; }

download_init_project() {
  if is_command git; then
    rm -rf "${PROJECT_NAME}"
    git clone "https://github.com/zthxxx/${PROJECT_NAME}.git" || exit 1
    cd "$PROJECT_NAME"
  else
    # macOS Mojave and above need `command line tools` for git
    echo '
    Please install git at first. 
    (Usually by `sudo xcode-select --install`)
    '
    exit 1
  fi
}

echo '
+------------------------------+
        Initialize macOS
+------------------------------+
'

mkdir -p ~/Downloads
cd ~/Downloads


download_init_project

# make `sudo` no-timeout in a session
sudo perl -i -pe "s/^Defaults\tenv_reset.*/Defaults\tenv_reset, timestamp_timeout=-1/" /etc/sudoers

sudo -i sudo -u $USER -i "`pwd`/init.sh" "`pwd`"

# restore `sudo` timeout to 60s
sudo perl -i -pe "s/^Defaults\tenv_reset.*/Defaults\tenv_reset, timestamp_timeout=60/" /etc/sudoers
