#!/usr/bin/env zsh

set -ex

local brew_taps=(
    denji/nginx
)

# brew core below
local runtime_environment=(
    coreutils
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
    asciinema
    ranger
    lazygit
    neovim
    smudge/smudge/nightlight
    neofetch
)

local network_tool=(
    git
    curl
    wget
    aria2
    annie
    proxychains-ng
    lrzsz
    nginx-full
    telnet
    mosh
    httpie
    rs/tap/curlie
    iproute2mac
    netcat
    socat
    iperf3
)


# brew cask below
local terminal_app=(
    iterm2
)

local network_app=(
    google-chrome
    telegram
    teamviewer
    paw
    wireshark
    netspot
    tailscale
)

local databse_manager=(
    datagrip
)

local editor_IDE_app=(
    typora
    visual-studio-code
    webstorm
    pycharm
)

local version_control_app=(
    fork
)

local dev_utils_app=(
    orbstack
    kitematic
)

local system_helper_service_app=(
    raycast
    intel-power-gadget
    istat-menus
    keycastr
    snipaste
    kap
    ubersicht
    monitorcontrol
    maczip
    hiddenbar
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
)

local office_app=(
    microsoft-office
)

local adobe=(
    adobe-creative-cloud
    sketch
    figma
    # clip-studio-paint
)

local gaming=(
    steam
)

local mas_only_app=(
    # 441258766   # Magnet
    836500024   # WeChat
    451108668   ## QQ
    # 1449412482  # Reeder 4
    1233965871  # ScreenBrush
)

local npm_global_app=(
    node-gyp
    nodemon
    esm
    typescript
    ts-node
    tsx
    git-split-diffs
    serve
    pm2
    eloc
)

brew tap ${brew_taps[@]}

brew install ${runtime_environment[@]} ${sys_pref_tool[@]} \
    ${terminal_tools[@]} ${network_tool[@]}

brew link --overwrite ${runtime_environment[@]} ${sys_pref_tool[@]} \
    ${terminal_tools[@]} ${network_tool[@]}

brew install --cask ${databse_manager[@]} ${terminal_app[@]} ${network_app[@]} ${editor_IDE_app[@]} \
    ${version_control_app[@]} ${system_helper_service_app[@]} ${quicklook_plugins[@]} \
    ${dev_utils_app} ${media_entertainment_app[@]} ${office_app[@]} ${adobe[@]} ${gaming[@]}

brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font

mas install ${mas_only_app[@]}

npm i -g ${npm_global_app[@]}

# https://github.com/banga/git-split-diffs
git config --global core.pager "git-split-diffs --color | less -RFX"
