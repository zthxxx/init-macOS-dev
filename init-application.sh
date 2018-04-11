#!/usr/bin/env bash

local runtime_environment=(
    python  node
)

local terminal_tool=(
    zsh
    md5sha1sum  autojump
)

local network_tool=(
    git curl wget proxychains-ng 
)

local database_service=(
    mysql   mongodb redis
    # studo-3T
)

local terminal_app=(
    iterm2  hyper
)

local network_app=(
    shadowsocksx-ng
    google-chrome   telegram
)

local editor_IDE_app=(
    typora  visual-studio-code
    webstorm    pycharm
)

local version_control_app=(
    sourcetree  tower
)

local dev_utils_app={
    dash    cheatsheet
    docker  kitematic
}

local system_helper_service_app=(
    # magnet
    scroll-reverser
    alfred  istat-menus
    dropbox
)

local media_entertainment_app=(
    neteasemusic    iina
)

local office_app=(
    # spark
    microsoft-office
)


brew install ${runtime_environment[@]} ${terminal_tools[@]} ${network_tool[@]} ${database_service[@]}

brew cask install ${terminal_app[@]} ${network_app[@]} ${editor_IDE_app[@]} \
${version_control_app[@]} ${system_helper_service_app[@]} ${dev_utils_app}\
${media_entertainment_app[@]} ${office_app[@]}
