#!/usr/bin/env zsh

# git user setting
git config --global user.name zthxxx
git config --global user.email zthxxx.me@gmail.com

# To complete the installation of Cask adobe-creative-cloud, you must also run the installer at
if [[ -d /usr/local/Caskroom/adobe-creative-cloud ]]; then
    /usr/local/Caskroom/adobe-creative-cloud/latest/Creative\ Cloud\ Installer.app/Contents/MacOS/Install
fi

# mackup setting: https://github.com/lra/mackup/blob/master/doc/README.md#icloud
cp ./app-preferences/mackup.cfg  ~/.mackup.cfg

# aria2 config: https://aria2.github.io/manual/en/html/aria2c.html#aria2-conf
mkdir -p ~/.aria2
cp ./app-preferences/aria2.conf  ~/.aria2/aria2.conf
local bt_tracker=`curl -sSL https://github.com/ngosang/trackerslist/raw/master/trackers_all.txt | sed ':n;N;$!bn;s/\n\+/,/g'`
sed "-i" "s#^bt-tracker=.*#bt-tracker=${bt_tracker}#g" ~/.aria2/aria2.conf

# vscode user preference
cp ./app-preferences/vscode.json ~/Library/Application\ Support/Code/User/settings.json

# hyperjs preference
sed "-i" "
    s/^ \+fontSize:.*$/    fontSize: 16,/g;
    s/^ \+cursorShape:.*$/    cursorShape: 'BEAM',/g;
    s/^ \+shell:.*$/    shell: 'zsh',/g;
    s/^ \+windowSize:.*$/    windowSize: [1420, 900],/g;
" ~/.hyper.js
