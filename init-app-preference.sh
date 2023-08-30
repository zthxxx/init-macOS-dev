#!/usr/bin/env zsh

set -ex

# Git Config
git config --global user.name zthxxx
git config --global user.email zthxxx.me@gmail.com
git config --global core.ignorecase false
git config --global core.quotepath false
git config --global pull.ff only

## https://github.com/banga/git-split-diffs
## install `git-split-diffs` in 'init-application.sh'
git config --global core.pager "git-split-diffs --color | less -RFX"
git config --global split-diffs.theme-name dark

## push the current branch with the same name on the remote
## https://git-scm.com/docs/git-config#Documentation/git-config.txt-pushdefault
git config --global push.default simple

## Reuse Recorded Resolution in git-rebase
## https://blog.gitbutler.com/git-tips-1-theres-a-git-config-for-that/#reuse-recorded-resolution
git config --global rerere.enabled true
git config --global rerere.autoUpdate true

## https://blog.gitbutler.com/git-tips-2-new-stuff-in-git/#some-git-branch-stuff
git config --global branch.sort -committerdate
git config --global column.ui auto

## https://blog.gitbutler.com/git-tips-2-new-stuff-in-git/#safe-force-pushing
## always using `git push --force-with-lease` instead of `git push --force`
git config --global alias.pushf push --force-with-lease

## https://docs.gitlab.com/ee/user/project/repository/signed_commits/ssh.html#verify-commits-locally
### if allowed_signers file not contains public key, append it
if ! grep -qFf ~/.ssh/zthxxx.ed25519.pub ~/.ssh/allowed_signers 2>/dev/null; then
  # format of "ALLOWED SIGNERS" section in `ssh-keygen`
  echo "zthxxx.me@gmail.com $(cat ~/.ssh/zthxxx.ed25519.pub)" >> ~/.ssh/allowed_signers
fi
git config --global gpg.ssh.allowedSignersFile ~/.ssh/allowed_signers

## https://blog.gitbutler.com/git-tips-1-theres-a-git-config-for-that/#conditional-configs
mkdir -p ~/.config/git
git config --file ~/.config/git/github user.name zthxxx
git config --file ~/.config/git/github user.email zthxxx.me@gmail.com
git config --file ~/.config/git/github user.signingKey ~/.ssh/zthxxx.ed25519
git config --file ~/.config/git/github commit.gpgsign true
git config --file ~/.config/git/github gpg.format ssh
git config --global 'includeIf.hasconfig:remote.*.url:git@github.com:zthxxx/**.path' ~/.config/git/github


# gpg for Git committer for all web commits made on GitHub.com
curl -sS https://github.com/web-flow.gpg | gpg --import

# screen & tmux config
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
brew info laggardkernel/tap/iterm2-zmodem
open "https://github.com/laggardkernel/homebrew-tap/blob/master/Formula/iterm2-zmodem.rb"
