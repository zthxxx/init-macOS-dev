#!/usr/bin/env zsh

# git user setting
git config --global user.name zthxxx
git config --global user.email zthxxx.me@gmail.com

# screen config
curl -sL https://gist.github.com/zthxxx/df7e121048b12c80f260285d88e1091f/raw/.screenrc -o ~/.screenrc

# mackup setting: https://github.com/lra/mackup/blob/master/doc/README.md#icloud
cp ./app-preferences/mackup.cfg  ~/.mackup.cfg

# pip config
cp ./app-preferences/pip.conf ~/.pip/pip.conf

# node yarn config
cp ./app-preferences/.yarnrc ~/.yarnrc

# aria2 config: https://aria2.github.io/manual/en/html/aria2c.html#aria2-conf
mkdir -p ~/.aria2
cp ./app-preferences/aria2.conf  ~/.aria2/aria2.conf
local bt_tracker=`curl -sSL https://github.com/ngosang/trackerslist/raw/master/trackers_all.txt | perl -0pe "s/\n+/,/gms"
perl -i -pe "s#^bt-tracker=.*#bt-tracker=${bt_tracker}#g" ~/.aria2/aria2.conf

# vscode user preference
cp ./app-preferences/vscode.json ~/Library/Application\ Support/Code/User/settings.json

# hyperjs preference
perl -i -pe "
    s/^ \+fontSize:.*$/    fontSize: 16,/g;
    s/^ \+cursorShape:.*$/    cursorShape: 'BEAM',/g;
    s/^ \+shell:.*$/    shell: 'zsh',/g;
    s/^ \+windowSize:.*$/    windowSize: [1420, 900],/g;
" ~/.hyper.js

# lrzsz setup
# https://gist.github.com/zthxxx/9171c12538605d92781b74274ba8b9e1
recv='/usr/local/bin/iterm2-recv-zmodem.sh'
send='/usr/local/bin/iterm2-send-zmodem.sh'
curl -sSL https://github.com/mmastrac/iterm2-zmodem/raw/master/iterm2-recv-zmodem.sh -o "$recv"
curl -sSL https://github.com/mmastrac/iterm2-zmodem/raw/master/iterm2-send-zmodem.sh -o "$send"
chmod +x "$recv" "$send"
open "https://github.com/mmastrac/iterm2-zmodem#setup"

# To complete the installation of Cask adobe-creative-cloud, you must also run the installer at
if [[ -d /usr/local/Caskroom/adobe-creative-cloud ]]; then
    /usr/local/Caskroom/adobe-creative-cloud/latest/Creative\ Cloud\ Installer.app/Contents/MacOS/Install
fi
