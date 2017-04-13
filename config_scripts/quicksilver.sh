#!/usr/bin/env bash

defaults write com.blacktree.Quicksilver "Reset Delay" '0.75'
defaults write com.blacktree.Quicksilver "Hide Dock Icon" -bool true
defaults write com.blacktree.Quicksilver "QSResultViewRowHeight" '18'
defaults write com.blacktree.Quicksilver "QSForcedKeyboardIDOnActivation" 'com.apple.keylayout.Dvorak'
/usr/libexec/PlistBuddy ~/Library/Preferences/com.blacktree.Quicksilver.plist -c "Set QSActivationHotKey:keyCode 49"
/usr/libexec/PlistBuddy ~/Library/Preferences/com.blacktree.Quicksilver.plist -c "Set QSActivationHotKey:modifiers 1048840"

if [ ! -f '~/Library/Application Support/Quicksilver/PlugIns/com.qsapp.MiniBezel.63.qsplugin' ] ; then
  wget 'https://qs0.qsapp.com/plugins/download.php?id=com.qsapp.MiniBezel&version=99' -O /tmp/mini_bezel.qspkg
  open /tmp/mini_bezel.qspkg
fi
