#!/usr/bin/env bash

set -ex

brew install git curl wget proxychains-ng 

# to store clash config in iCloud
# ```bash
# cp -f ~/.config/clash/config.yaml ~/Library/Mobile\ Documents/com~apple~CloudDocs/Documents/Preferences/clash/config.yaml
# ```
# [Hint] absolute path of iCloud is ~/Library/Mobile\ Documents/com~apple~CloudDocs/Documents
if [[ -r ~/Library/Mobile\ Documents/com~apple~CloudDocs/Documents/Preferences/clash/config.yaml ]]; then
    mkdir -p ~/.config/clash
    cp -f ~/Library/Mobile\ Documents/com~apple~CloudDocs/Documents/Preferences/clash/config.yaml ~/.config/clash/config.yaml

    ## https://github.com/Dreamacro/clash/tree/premium
    curl -fSL https://github.com/Dreamacro/clash/releases/download/premium/clash-darwin-amd64-2023.05.29.gz -o ~/Downloads/clash.gz
    gzip -d -c ~/Downloads/clash.gz > /usr/local/bin/clash
    chmod +x /usr/local/bin/clash
    l /usr/local/bin/clash

    pm2 start clash
fi

perl -i -pe "
    s/^socks4\s*127\.0\.0\.1.*//gms;
    s/^socks5 	127\.0.*/socks5 	127.0.0.1 7890/g;
" /usr/local/etc/proxychains.conf

export http_proxy=http://127.0.0.1:1086
export https_proxy=http://127.0.0.1:1086
