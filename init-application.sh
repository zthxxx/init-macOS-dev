#!/usr/bin/env zsh

# brew core below
local runtime_environment=(
    gcc
    glib
    python
    ipython
    node
    openssl
)

local sys_pref_tool=(
    htop
    duti
    tree
    ncdu
    unrar
    pandoc
    mas
    mackup
    coreutils
    ffmpeg
)

local terminal_tool=(
    screen
    tmux
    gnu-sed
    terminal-notifier
    source-highlight
    md5sha1sum
    autojump
    colordiff
    expect
    zsh
)

local network_tool=(
    git
    curl
    wget
    aria2
    proxychains-ng
    lrzsz
    nginx
    telnet
    mosh
)

local database_service=(
    mysql
    mongodb
    redis
)


# brew cask below
local terminal_app=(
    iterm2
)

local network_app=(
    shadowsocksx-ng
    google-chrome
    telegram
    teamviewer
    paw
    wireshark
)

local databse_manager=(
    robo-3t
    navicat-premium
)

local editor_IDE_app=(
    typora
    visual-studio-code
    webstorm
    pycharm
    datagrip
)

local version_control_app=(
    sourcetree
)

local dev_utils_app=(
    docker
    kitematic
)

local system_helper_service_app=(
    scroll-reverser
    alfred
    dropbox
    intel-power-gadget
    istat-menus
    keycastr
    steermouse
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
    neteasemusic
    iina
    boom-3d
)

local office_app=(
    microsoft-office
    xmind
)

local adobe=(
    adobe-creative-cloud
    sketch
    # clip-studio-paint
)

local gaming=(
    steam
)

local mas_only_app=(
    441258766   # Magnet
    1176895641  # Spark
    836500024   # WeChat
    1189898970  # WeChat Work
    # 1449412482  # Reeder 4
)

brew install ${runtime_environment[@]} ${sys_pref_tool[@]} \
    ${terminal_tools[@]} ${network_tool[@]} ${database_service[@]}

brew link --overwrite ${runtime_environment[@]} ${sys_pref_tool[@]} \
    ${terminal_tools[@]} ${network_tool[@]} ${database_service[@]}

brew cask install ${databse_manager[@]} ${terminal_app[@]} ${network_app[@]} ${editor_IDE_app[@]} \
    ${version_control_app[@]} ${system_helper_service_app[@]} ${quicklook_plugins[@]} \
    ${dev_utils_app} ${media_entertainment_app[@]} ${office_app[@]} ${adobe[@]} ${gaming[@]}

mas install ${mas_only_app[@]}
