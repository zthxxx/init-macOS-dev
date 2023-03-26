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
    rust
    golang
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
    onefetch
    clol
)

local network_tool=(
    git
    curl
    wget
    aria2
    laggardkernel/tap/iterm2-zmodem
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

local im_app=(
    discord
    telegram
)

# brew cask below
local terminal_app=(
    iterm2
    warp
)

local network_app=(
    google-chrome
    teamviewer
    rapidapi
    postman
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
    hammerspoon
    # intel-power-gadget
    istat-menus
    keycastr
    snipaste
    ubersicht
    monitorcontrol
    maczip
    hiddenbar
    wacom-tablet
    oversight
    input-source-pro
    trex
    logitech-options
    homebrew/cask-fonts/font-hack-nerd-font
    alt-tab
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
    obsidian
    microsoft-office
)

local adobe=(
    # adobe-creative-cloud
    sketch
    figma
    spline
    blender
)

local gaming=(
    steam
    discord
)

local mas_only_app=(
    836500024   # WeChat
    451108668   # QQ
    1233965871  # ScreenBrush
    747648890   # Telegram
    1136220934  # Infuse
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
    pnpm
    yarn
    @builder.io/ai-shell
    aicommits
)

brew tap ${brew_taps[@]}

brew install ${runtime_environment[@]} ${sys_pref_tool[@]} \
    ${terminal_tool[@]} ${network_tool[@]}

brew link --overwrite ${runtime_environment[@]} ${sys_pref_tool[@]} \
    ${terminal_tool[@]} ${network_tool[@]}

brew install --cask ${databse_manager[@]} ${terminal_app[@]} ${network_app[@]} ${editor_IDE_app[@]} \
    ${version_control_app[@]} ${system_helper_service_app[@]} ${quicklook_plugins[@]} \
    ${dev_utils_app} ${media_entertainment_app[@]} ${im_app[@]} ${office_app[@]} ${adobe[@]} ${gaming[@]}

mas install ${mas_only_app[@]}

npm i -g ${npm_global_app[@]}

# https://github.com/banga/git-split-diffs
git config --global core.pager "git-split-diffs --color | less -RFX"
