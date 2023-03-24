#!/usr/bin/env zsh

set -ex

# git user setting
git config --global user.name zthxxx
git config --global user.email zthxxx.me@gmail.com
git config --global core.ignorecase false
git config --global core.quotepath false

# screen config
curl -sLH 'Cache-Control: no-cache' https://gist.github.com/zthxxx/df7e121048b12c80f260285d88e1091f/raw/.screenrc -o ~/.screenrc
curl -sLH 'Cache-Control: no-cache' https://gist.github.com/zthxxx/bbbb37c100254d688236c21e8b977b85/raw/.tmux.conf -o ~/.tmux.conf

# mackup setting: https://github.com/lra/mackup/blob/master/doc/README.md#icloud
cp ./app-preferences/mackup.cfg  ~/.mackup.cfg

# pip config
mkdir -p ~/.pip/
cp ./app-preferences/pip.conf ~/.pip/pip.conf


# aria2 config: https://aria2.github.io/manual/en/html/aria2c.html#aria2-conf
mkdir -p ~/.aria2/
cp ./app-preferences/aria2.conf  ~/.aria2/aria2.conf
local bt_tracker=`curl -sSL -H 'Cache-Control: no-cache' https://github.com/ngosang/trackerslist/raw/master/trackers_all.txt | perl -0pe "s/\n+/,/gms"`
perl -i -pe "s#^bt-tracker=.*#bt-tracker=${bt_tracker}#g" ~/.aria2/aria2.conf

# vscode user preference
mkdir -p ~/Library/Application\ Support/Code/User/
cp ./app-preferences/vscode.json ~/Library/Application\ Support/Code/User/settings.json

# hyperjs preference
perl -i -pe "
    s/^ \+fontSize:.*$/    fontSize: 16,/g;
    s/^ \+cursorShape:.*$/    cursorShape: 'BEAM',/g;
    s/^ \+shell:.*$/    shell: 'zsh',/g;
    s/^ \+windowSize:.*$/    windowSize: [1420, 900],/g;
" ~/.hyper.js


# iTerm2 preference
# Save: 
#   - iTerm2 menu > Preferences > "General" tab > "Preferences" > Load preferences from a custom folder > Save Now
#     then, change file name to `iTerm2.plist`.
#     `mv app-preferences/com.googlecode.iterm2.plist app-preferences/iTerm2.plist`
#   
#   - iTerm2 menu > Profiles > Localhost > Other Actions > Save Profile As JSON

## https://iterm2.com/documentation-dynamic-profiles.html
## https://stackoverflow.com/questions/22943676/how-to-export-iterm2-profiles
defaults import com.googlecode.iterm2 ./app-preferences/iTerm2.plist
## iTerm2 plist 中已经包含所有 profiles
# mkdir -p ~/Library/Application\ Support/iTerm2/DynamicProfiles
# cp ./app-preferences/iTerm2-profile-Localhost.json ~/Library/Application\ Support/iTerm2/DynamicProfiles/Localhost.json

## iTerm2 lrzsz setup
# https://gist.github.com/zthxxx/9171c12538605d92781b74274ba8b9e1
# https://github.com/laggardkernel/iterm2-zmodem
# https://github.com/laggardkernel/homebrew-tap/blob/master/Formula/iterm2-zmodem.rb
brew install laggardkernel/tap/iterm2-zmodem
open "https://github.com/laggardkernel/homebrew-tap/blob/master/Formula/iterm2-zmodem.rb"
