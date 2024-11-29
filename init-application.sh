#!/usr/bin/env zsh

set -ex



# brew core below
local runtime_environment=(
    coreutils
    gcc
    glib
    gnupg
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
    gdu
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
    jless
    lnav
    librsvg
    imagemagick
)

local network_tool=(
    git
    git-lfs
    curl
    wget
    aria2
    laggardkernel/tap/iterm2-zmodem
    telnet
    mosh
    httpie
    rs/tap/curlie
    iproute2mac
    netcat
    socat
    iperf3
    doggo
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
    # sing-box client
    sfm
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
)

local system_helper_service_app=(
    raycast
    istat-menus
    keycastr
    snipaste
    ubersicht
    monitorcontrol
    maczip
    jordanbaird-ice
    wacom-tablet
    oversight
    input-source-pro
    trex
    # replace to logi-options plus  https://www.logitech.com/en-us/software/logi-options-plus.html
    # logitech-options
    homebrew/cask-fonts/font-hack-nerd-font
    alt-tab
    mac-mouse-fix
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

brew install ${runtime_environment[@]} ${sys_pref_tool[@]} \
    ${terminal_tool[@]} ${network_tool[@]}

brew link --overwrite ${runtime_environment[@]} ${sys_pref_tool[@]} \
    ${terminal_tool[@]} ${network_tool[@]}

brew install --cask ${databse_manager[@]} ${terminal_app[@]} ${network_app[@]} ${editor_IDE_app[@]} \
    ${version_control_app[@]} ${system_helper_service_app[@]} ${quicklook_plugins[@]} \
    ${dev_utils_app} ${media_entertainment_app[@]} ${im_app[@]} ${office_app[@]} ${adobe[@]} ${gaming[@]}

mas install ${mas_only_app[@]}

npm i -g ${npm_global_app[@]}
