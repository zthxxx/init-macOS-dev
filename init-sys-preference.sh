#!/usr/bin/env zsh

. ./template-render.sh

preference.dock() {
    # ref: https://sspai.com/post/33493
    defaults write com.apple.dock showhidden -bool true
    defaults write com.apple.dock mineffect suck
    defaults write com.apple.dock mouse-over-hilite-stack -bool true
    defaults write com.apple.dock autohide -bool true
    defaults write com.apple.dock autohide-delay -int 0
    killall Dock
}

preference.finder() {
    defaults write com.apple.finder AppleShowAllFiles -bool true
    # ref: https://support.apple.com/en-us/HT1629
    defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
    killall Finder
}

specific_UTIs_for_app() {
    # ref: https://developer.apple.com/library/content/documentation/Miscellaneous/Reference/UTIRef/Articles/System-DeclaredUniformTypeIdentifiers.html
    local UTIs_setting_file="specific-UTIs-for-app"

    local UTI_VSCode=`osascript -e 'id of app "Visual Studio Code"'`
    local UTI_Typora=`osascript -e 'id of app "Typora"'`
    local UTI_NeteaseMusic=`osascript -e 'id of app "NeteaseMusic"'`
    local UTI_IINA=`osascript -e 'id of app "IINA"'`
    local UTI_Chrome=`osascript -e 'id of app "Google Chrome"'`
    local UTI_Spark=`osascript -e 'id of app "Spark"'`

    tmplt.render "$UTIs_setting_file"
    duti "$UTIs_setting_file"
}


preference.dock
preference.finder
specific_UTIs_for_app 
