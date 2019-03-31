#!/usr/bin/env bash

brew install git curl wget proxychains-ng 
brew cask install shadowsocksx-ng

# to store plist as json like
# defaults read com.qiuyuzhou.ShadowsocksX-NG > ~/Documents/Shadowconfig/ssx-ng-config.plist
# or export to xml or hex
# defaults export com.qiuyuzhou.ShadowsocksX-NG ~/Documents/Shadowconfig/ssx-ng-config.plist
# [Hint] absolute path of iCloud is ~/Library/Mobile\ Documents/com~apple~CloudDocs/Documents
if [[ -r ~/Library/Mobile\ Documents/com~apple~CloudDocs/Documents/Shadowconfig/ssx-ng-config.plist ]]; then
    defaults import com.qiuyuzhou.ShadowsocksX-NG ~/Library/Mobile\ Documents/com~apple~CloudDocs/Documents/Shadowconfig/ssx-ng-config.plist
    nohup /Applications/ShadowsocksX-NG.app/Contents/MacOS/ShadowsocksX-NG &> /dev/null &
fi

perl -i -pe "
    s/^socks4\s*127\.0\.0\.1.*//gms;
    s/^socks5 	127\.0.*/socks5 	127.0.0.1 1080/g;
" /usr/local/etc/proxychains.conf

export http_proxy=http://127.0.0.1:1086
export https_proxy=http://127.0.0.1:1086
