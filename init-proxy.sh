#!/usr/bin/env bash

brew install git curl wget proxychains-ng 
brew cask install shadowsocksx-ng

# to store plist as json
# defaults read com.qiuyuzhou.ShadowsocksX-NG > ~/Documents/Shadowconfig/ssx-ng-config.plist
# or export to hex
# defaults export com.qiuyuzhou.ShadowsocksX-NG ~/Documents/Shadowconfig/ssx-ng-config.plist
if [[ -r ~/Documents/Shadowconfig/ssx-ng-config.plist ]]; then
    defaults import com.qiuyuzhou.ShadowsocksX-NG ~/Documents/Shadowconfig/ssx-ng-config.plist
    nohup /Applications/ShadowsocksX-NG.app/Contents/MacOS/ShadowsocksX-NG &> /dev/null &
fi

sed "-i" "
    /^socks4 	127\.0\.0\.1/d;
    s/^socks5 	127\.0.*/socks5 	127.0.0.1 1080/g;
" /usr/local/etc/proxychains.conf
