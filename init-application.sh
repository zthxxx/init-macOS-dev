#!/usr/bin/env zsh

local runtime_environment=(
    python  node
)

local sys_pref_tool=(
    mas duti
    mackup
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
)


local terminal_app=(
    iterm2  hyper
)

local network_app=(
    shadowsocksx-ng
    google-chrome   telegram
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
    dash    cheatsheet
    docker  kitematic
)

local system_helper_service_app=(
    # magnet
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
    # spark
    microsoft-office
)

local adobe=(
    adobe-creative-cloud
    # adobe-photoshop-cc
)

local mas_only_app=(
    441258766   # Magnet
    1176895641  # Spark
)

brew install ${runtime_environment[@]} ${sys_pref_tool[@]} ${terminal_tools[@]} \
    ${network_tool[@]} ${database_service[@]}

brew cask install ${databse_manager[@]} ${terminal_app[@]} ${network_app[@]} ${editor_IDE_app[@]} \
    ${version_control_app[@]} ${system_helper_service_app[@]} ${quicklook_plugins[@]} \
    ${dev_utils_app} ${media_entertainment_app[@]} ${office_app[@]} ${adobe[@]} 

mas install ${mas_only_app[@]}

# To complete the installation of Cask adobe-creative-cloud, you must also run the installer at
/usr/local/Caskroom/adobe-creative-cloud/latest/Creative\ Cloud\ Installer.app/Contents/MacOS/Install

# mackup setting: https://github.com/lra/mackup/blob/master/doc/README.md#icloud
cat > ~/.mackup.cfg <<-EOF
[storage]
engine = icloud
EOF

