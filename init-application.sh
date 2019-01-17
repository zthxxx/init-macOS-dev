#!/usr/bin/env zsh

# brew core below
local runtime_environment=(
    python  ipython
    node
)

local sys_pref_tool=(
    mas duti  ncdu
    mackup  pandoc
    unrar
)

local terminal_tool=(
    zsh     gnu-sed
    tmux    screen
    terminal-notifier
    md5sha1sum  autojump
    colordiff
)

local network_tool=(
    git curl wget aria2
    proxychains-ng
    lrzsz
)

local database_service=(
    mysql   mongodb redis
)


# brew cask below
local terminal_app=(
    iterm2  hyper
)

local network_app=(
    shadowsocksx-ng
    google-chrome   telegram
    teamviewer  paw
)

local databse_manager=(
    robo-3t
    navicat-premium
)

local editor_IDE_app=(
    typora  visual-studio-code
    webstorm    pycharm
)

local version_control_app=(
    sourcetree  tower
)

local dev_utils_app=(
    dash    docker
    kitematic
)

local system_helper_service_app=(
    scroll-reverser
    alfred  istat-menus
    dropbox
)

local quicklook_plugins=(
    qlvideo
    qlstephen
    qlmarkdown
    qlcolorcode
    qlprettypatch
    quicklook-csv
    webpquicklook
    quicklook-json
)

local media_entertainment_app=(
    neteasemusic    iina
)

local office_app=(
    microsoft-office
    xmind
)

local adobe=(
    adobe-creative-cloud
    # adobe-photoshop-cc
    clip-studio-paint
)

local gaming=(
    steam
)

local mas_only_app=(
    441258766   # Magnet
    1176895641  # Spark
    836500024   # WeChat
    1189898970  # WeChat Work
)

brew install --with-default-names ${runtime_environment[@]} ${sys_pref_tool[@]} \
    ${terminal_tools[@]} ${network_tool[@]} ${database_service[@]}

brew cask install ${databse_manager[@]} ${terminal_app[@]} ${network_app[@]} ${editor_IDE_app[@]} \
    ${version_control_app[@]} ${system_helper_service_app[@]} ${quicklook_plugins[@]} \
    ${dev_utils_app} ${media_entertainment_app[@]} ${office_app[@]} ${adobe[@]} ${gaming[@]}

mas install ${mas_only_app[@]}
