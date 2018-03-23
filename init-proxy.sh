#!/usr/bin/env bash

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install git curl wget proxychains-ng 
brew cask install shadowsocksx-ng
defaults import com.qiuyuzhou.ShadowsocksX-NG ~/Documents/ssx-ng-config.plist
/Applications/ShadowsocksX-NG.app/Contents/MacOS/ShadowsocksX-NG &> /dev/null &
sed -i '/socks4 	127.0.0.1/d' /usr/local/etc/proxychains.conf
sed -i '/socks5 	127.0.0.1/d' /usr/local/etc/proxychains.conf
echo "socks5 	127.0.0.1 1080" >> /usr/local/etc/proxychains.conf

